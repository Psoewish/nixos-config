{ lib, config, ... }:
{
  fractal.tags = [ "homelab" ];
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
