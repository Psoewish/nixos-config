{pkgs, ...}: {
  environment.systemPackages = [pkgs.helix];
  home.xdg.config.files."helix/config.toml".source = ./config.toml;
  home.xdg.config.files."helix/languages.toml".source = ./languages.toml;
}
