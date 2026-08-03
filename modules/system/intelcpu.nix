{
  flake.modules.nixos.intelcpu = {lib, ...}: {
    hardware.cpu.intel.updateMicrocode = lib.mkDefault true;
    boot.kernelModules = ["kvm-intel"];
  };
}
