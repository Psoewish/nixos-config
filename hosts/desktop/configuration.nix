{
  inputs,
  pkgs,
  ...
}: {
  imports = with inputs.self.modules.nixos; [
    dev
    editor
    gaming
    mango
    media
    system

    cli-tools
    discord
    fish
    foot
    gamesir
    helium
    pipewire
    qmk
    streamcontroller
    stylix
    tartarus
  ];

  system.stateVersion = "26.11";
  nixpkgs.hostPlatform.system = "x86_64-linux";

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  boot.kernelModules = ["kvm-amd"];
  hardware = {
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
    };
  };

  networking.interfaces.enp9s0.ipv4.addresses = [
    {
      address = "192.168.1.16";
      prefixLength = 24;
    }
  ];
}
