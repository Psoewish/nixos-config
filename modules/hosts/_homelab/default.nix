{ inputs, ... }: {
  flake.nixosConfigurations.homelab = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = with inputs.self.modules.nixos; [
      core
      homelab
    ];
  };

  flake.modules.nixos.homelab = { inputs, config, ... }: {
    imports = with inputs.self.modules.nixos; [
      intelcpu
      intelgpu
    ];

    networking.hostName = config.constants.hosts.homelab.hostName;
    system.stateVersion = config.constants.hosts.homelab.stateVersion;
    nixpkgs.hostPlatform = config.constants.hosts.homelab.system;

    networking.interfaces.enp94s0.ipv4.addresses = [
      {
        address = config.constants.hosts.homelab.staticIp;
        prefixLength = 24;
      }
    ];
    networking.firewall = {
      allowedTCPPorts = [
        53
        80
        443
      ];
      allowedUDPPorts = [ 53 ];
    };
  };
}
