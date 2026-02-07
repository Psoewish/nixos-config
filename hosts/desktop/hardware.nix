{
  lib,
  config,
  pkgs,
  ...
}:
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
    };
  };

  environment.systemPackages = [ pkgs.vial ];

  security.rtkit.enable = true;

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };
}
