{ lib, config, ... }:
{
  hardware = {
    keyboard.qmk.enable = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
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
}
