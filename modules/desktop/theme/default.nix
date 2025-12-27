{ username, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    roboto
    source-han-sans
    source-han-serif
    maple-mono.NF
    nerd-fonts.sauce-code-pro
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
        monospace = [ "SauceCodePro Nerd Font Propo" ];
        sansSerif = [
          "Roboto"
          "Source Han Sans"
        ];
        serif = [
          "Roboto"
          "Source Han Serif"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
