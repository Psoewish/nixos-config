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

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    adwsteamgtk
  ];

  home-manager.users.${username} = {
    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      hyprcursor.enable = true;

      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    gtk = {
      enable = true;
      font = {
        name = "Maple Mono NF CN";
        package = pkgs.maple-mono.NF-CN;
        size = 12;
      };
      colorScheme = "dark";
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
    };

    qt = {
      enable = true;
      style = {
        name = "adwaita-dark";
      };
    };
  };
}
