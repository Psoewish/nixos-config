{inputs, ...}: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = with inputs.self.modules.nixos; [desktop];
  };

  flake.modules.nixos.desktop = {
    inputs,
    config,
    pkgs,
    ...
  }: {
    imports = with inputs.self.modules;
      (with nixos; [
        core

        # hardware
        amdcpu
        amdgpu

        # input devices
        vial
        streamcontroller
        input-remapper
        openlinkhub

        # dev
        virtualisation
        helix
        zed

        # desktop session
        cosmic

        # terminal stuff
        fish
        ghostty

        # applications
        discord
        pear-desktop
        gaming
        helium
        obs

        # theme
        catppuccin

        # TEMP, MOVE LATER
        psoewish
        flatpak
      ])
      ++ [(generic.constants)];

    networking.hostName = config.constants.hosts.desktop.hostName;
    system.stateVersion = config.constants.hosts.desktop.stateVersion;
    nixpkgs.hostPlatform = config.constants.hosts.desktop.system;
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-zen4;
    services.scx = {
      enable = true;
      scheduler = "scx_lavd";
      extraArgs = ["--performance"];
    };

    networking.interfaces.enp9s0.ipv4.addresses = [
      {
        address = config.constants.hosts.desktop.staticIp;
        prefixLength = 24;
      }
    ];
  };
}
