let
  mkBind = path: {
    depends = ["/data"];
    device = "${path}";
    fsType = "none";
    options = ["bind" "x-gvfs-hide"];
  };
in {
  fileSystems = {
    # XDG User Dirs
    "/home/psoewish/Downloads" = mkBind "/data/home/Downloads";
    "/home/psoewish/Documents" = mkBind "/data/home/Documents";
    "/home/psoewish/Music" = mkBind "/data/home/Music";
    "/home/psoewish/Pictures" = mkBind "/data/home/Pictures";
    "/home/psoewish/Projects" = mkBind "/data/home/Projects";
    "/home/psoewish/Videos" = mkBind "/data/home/Videos";

    # SSH keys/settings
    "/home/psoewish/.ssh" = mkBind "/data/home/.ssh";

    # Games
    "/home/psoewish/.local/share/Steam/steamapps" = mkBind "/data/games/Steam/steamapps";

    "/home/psoewish/test.txt" = mkBind "/home/nixos-config/test.txt";
  };
}
