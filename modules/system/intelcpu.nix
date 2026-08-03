{
  flake.modules.nixos.intelcpu = {
    lib,
    config,
    ...
  }: {
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    boot.kernelModules = ["kvm-intel"];
  };
}
