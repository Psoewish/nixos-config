{ pkgs, ... }:
{
  fractal.tags = [ "desktop" ];
  environment.systemPackages = [ pkgs.pulsemixer ];
}
