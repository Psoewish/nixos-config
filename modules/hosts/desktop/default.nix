{
  flake.hosts.nixos.desktop = {
    system = "x86_64-linux";
    stateVersion = "25.11";
    staticIp = "192.168.1.16";
    users.psoewish = {
      isPrimary = true;
      extraGroups = [
        "video"
        "render"
        "input"
        "uinput"
      ];
      shell = "fish";
    };
    pubKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF0Ab3o9NKMJT15F3bpwMReI2dIEUxOb0qI2PNMVx8Mg";
  };

  flake.modules.nixos.desktop = {
    pkgs,
    config,
    ...
  }: {
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-zen4;
    services.scx = {
      enable = true;
      scheduler = "scx_lavd";
      extraArgs = ["--performance"];
    };

    networking.interfaces.enp9s0.ipv4.addresses = [
      {
        address = config.hosts.desktop.staticIp;
        prefixLength = 24;
      }
    ];
  };
}
