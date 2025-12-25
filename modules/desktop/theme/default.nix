{ username, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    roboto
    maple-mono.NF
    noto-fonts-color-emoji
  ];

  home-manager.users.${username} = {
    home.pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
      gtk.enable = true;
      hyprcursor.enable = true;
    };
    gtk = {
      enable = true;
      font = {
        name = "Maple Mono NF";
        size = 12;
      };
    };
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Maple Mono NF" ];
        sansSerif = [ "Maple Mono NF" ];
        serif = [ "Maple Mono NF" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
