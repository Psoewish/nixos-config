{ ... }:
{
  imports = [
    ./bspwm.nix
    ./sxhkd.nix
  ];

  services.xserver.windowManager.bspwm.enable = true;
}
