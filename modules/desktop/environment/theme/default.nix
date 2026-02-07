{ username, pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      maple-mono.NF-CN
      roboto
      nerd-fonts.caskaydia-cove
      nerd-fonts.fira-code
    ];

    fontconfig = {
      useEmbeddedBitmaps = true;
      defaultFonts = {
        serif = [ "Maple Mono NF CN" ];
        sansSerif = [ "Maple Mono NF CN" ];
        monospace = [ "Maple Mono NF CN" ];
      };
    };
  };

  home-manager.users.${username} = {
    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      hyprcursor.enable = true;

      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    gtk.iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus Dark";
    };
  };
}
