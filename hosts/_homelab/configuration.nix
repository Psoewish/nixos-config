{
  inputs,
  pkgs,
  ...
}: {
  imports =
    # Module imports
    (with inputs.self.modules.nixos; [
      system
      cli
      fish
      git
      helix
      podman
    ])
    # Hardware setup
    ++ (with inputs.nixos-hardware.nixosModules; [
      common-cpu-intel
      common-pc-ssd
    ]);

  system.stateVersion = "26.11";
  nixpkgs.hostPlatform.system = "x86_64-linux";

  boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelModules = ["kvm-intel"];

  networking = {
    interfaces.enp94s0.ipv4.addresses = [
      {
        address = "192.168.1.100";
        prefixLength = 24;
      }
    ];

    firewall = {
      allowedTCPPorts = [
        53
        80
        443
      ];
      allowedUDPPorts = [53];
    };
  };
}
