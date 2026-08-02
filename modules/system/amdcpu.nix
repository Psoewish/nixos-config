{
  flake.modules.nixos.amdcpu = { config, lib, ... }: {
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    boot.kernelModules = [ "kvm-amd" ];
  };
}
