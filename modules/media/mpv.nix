{pkgs, ...}: {
  home.config.programs.mpv.enable = true;
  home.config.home.packages = [pkgs.celluloid];
}
