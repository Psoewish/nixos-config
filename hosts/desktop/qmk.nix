{ pkgs, ... }:
{
  fractal.tags = [ "desktop" ];
  hardware.keyboard.qmk.enable = true;
  environment.systemPackages = [ pkgs.vial ];
}
