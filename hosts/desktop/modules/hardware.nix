{
  flake.modules.nixos.desktop = {config, ...}: {
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
      amdgpu = {
        initrd.enable = true;
        opencl.enable = true;
        overdrive.enable = true;
      };
    };
    boot.kernelModules = ["kvm-amd"];
    hardware.enableAllFirmware = true;
    hardware.cpu.amd.updateMicrocode = config.hardware.enableRedistributableFirmware;
  };
}
