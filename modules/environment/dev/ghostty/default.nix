{pkgs,...}: {
  environment.systemPackages = [pkgs.ghostty];
  home.xdg.config.files."ghostty/config".source = ./config;
}
