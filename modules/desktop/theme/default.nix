{ username, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    roboto
    roboto-serif
    nerd-fonts.caskaydia-cove
    nerd-fonts.fira-code
    nerd-fonts.monaspace
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
        name = "Roboto";
        size = 12;
      };
    };
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "CaskaydiaCove Nerd Font Propo" ];
        sansSerif = [ "Roboto" ];
        serif = [ "Roboto Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
