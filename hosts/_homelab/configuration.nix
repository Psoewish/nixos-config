{inputs, ...}: {
  system.stateVersion = "26.11";
  nixpkgs.hostPlatform.system = "x86_64-linux";
  imports = with inputs.nixos-hardware.nixosModules; [
    common-cpu-intel
    common-pc-ssd
  ];
}
