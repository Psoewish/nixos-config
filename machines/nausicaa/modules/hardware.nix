{
  den.aspects.nausicaa.nixos = {
    hardware = {
      enableAllFirmware = true;
      amdgpu = {
        initrd.enable = true;
        opencl.enable = true;
      };
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
