{ username, pkgs, ... }:
{
  catppuccin = {
    enable = true;
    cursors.enable = false;
  };

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      maple-mono.NF-CN
      inter
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Maple Mono NF CN" ];
        sansSerif = [ "Maple Mono NF CN" ];
        monospace = [ "Maple Mono NF CN" ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    numix-icon-theme-square
    adwsteamgtk
  ];

  home-manager.users.${username} = {
    catppuccin = {
      enable = true;
      cursors.enable = false;
    };

    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      hyprcursor.enable = true;

      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };
}
