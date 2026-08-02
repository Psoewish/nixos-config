{
  flake.modules.nixos.amdgpu = {
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
  };
}
