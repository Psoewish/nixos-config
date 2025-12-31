{ pkgs, ... }:
{
  fractal.tags = [ "desktop" ];

  environment.systemPackages = [ pkgs.mpv ];
}
