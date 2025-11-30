{
  inputs,
  config,
  pkgs,
  ...
}:
let
  # rose-pine, rose-pine-moon, soft-server, ayu-mirage
  theme = "rose-pine";
in
{
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix = {
    enable = true;
    targets.qt.enable = false;
    overlays.enable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    icons = {
      enable = true;
      package = pkgs.rose-pine-icon-theme;
      dark = "rose-pine";
      light = "rose-pine-dawn";
    };

    fonts = {
      sansSerif = {
        package = pkgs.roboto;
        name = "Roboto";
      };
      serif = {
        package = pkgs.roboto-serif;
        name = "Roboto Serif";
      };
      monospace = {
        package = pkgs.nerd-fonts.caskaydia-cove;
        name = "CaskaydiaCove Nerd Font";
      };
      emoji = config.stylix.fonts.monospace;
      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 12;
      };
    };
  };
}
