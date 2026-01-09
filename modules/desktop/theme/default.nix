{
  username,
  config,
  pkgs,
  ...
}:
let
  theme = "soft-server";
in
{
  stylix = {
    enable = true;
    enableReleaseChecks = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
    # temporary location, set up proper wallpaper management later
    image = ./wall.png;

    cursor = {
      name = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
    };

    icons = {
      enable = true;
      dark = "Papirus Dark";
      light = "Papirus Light";
      package = pkgs.papirus-icon-theme;
    };

    fonts = {
      monospace = {
        name = "Maple Mono NF";
        package = pkgs.maple-mono.NF-CN;
      };
      sansSerif = config.stylix.fonts.monospace;
      serif = config.stylix.fonts.monospace;
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };

      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 12;
      };
    };
  };
  home-manager.users.${username}.stylix.enableReleaseChecks = false;
}
