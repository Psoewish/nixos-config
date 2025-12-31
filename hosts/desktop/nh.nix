{ ... }:
{
  fractal.tags = [ "desktop" ];
  programs.nh = {
    enable = true;
    flake = "/home/psoewish/flakes/nixos-config";
  };
}
