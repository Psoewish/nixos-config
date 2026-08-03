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
    imports = with inputs.self.modules.nixos; [
      core
      amdcpu
      amdgpu
      cosmic
      catppuccin
      virtualisation

      cli-tools
      discord
      fish
      gaming
      ghostty
      helium
      helix
      obs
      qutebrowser
      streamcontroller
      vial
      zed
      # tartarus
      razer
      youtube-music
      flatpak
      corsair

      psoewish
    ];

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
