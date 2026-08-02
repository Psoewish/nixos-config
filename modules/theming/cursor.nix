{
  flake.modules.homeManager.theme-base = { pkgs, ... }: {
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
