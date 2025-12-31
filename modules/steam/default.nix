{ pkgs, ... }:
{
  fractal.tags = [ "desktop" ];

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    protontricks.enable = true;
  };
}
