{
  fileSystems = {
    # OS drive (1TB nvme)
    "/boot" = {
      device = "/dev/disk/by-uuid/98AB-0405";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/" = {
      device = "/dev/disk/by-uuid/b250c6bd-f55b-4d7e-9fd7-d6404fb489cb";
      fsType = "xfs";
    };

    # Data drive (2TB nvme)
    "/data" = {
      device = "/dev/disk/by-uuid/f551872a-5f92-45d1-b6d8-969ca6482b8d";
      fsType = "xfs";
    };

    # Bind mounts for persistent data
    "/home/psoewish/.local/share/Steam/steamapps" = {
      depends = ["/data"];
      device = "/data/games/Steam/steamapps";
      fsType = "none";
      options = ["bind" "x-gvfs-hide"];
    };

    "/home/psoewish/Downloads" = {
      depends = ["/data"];
      device = "/data/home/Downloads";
      fsType = "none";
      options = ["bind" "x-gvfs-hide"];
    };

    "/home/psoewish/Documents" = {
      depends = ["/data"];
      device = "/data/home/Documents";
      fsType = "none";
      options = ["bind" "x-gvfs-hide"];
    };

    "/home/psoewish/Music" = {
      depends = ["/data"];
      device = "/data/home/Music";
      fsType = "none";
      options = ["bind" "x-gvfs-hide"];
    };

    "/home/psoewish/Pictures" = {
      depends = ["/data"];
      device = "/data/home/Pictures";
      fsType = "none";
      options = ["bind" "x-gvfs-hide"];
    };

    "/home/psoewish/Projects" = {
      depends = ["/data"];
      device = "/data/home/Projects";
      fsType = "none";
      options = ["bind" "x-gvfs-hide"];
    };

    "/home/psoewish/Videos" = {
      depends = ["/data"];
      device = "/data/home/Videos";
      fsType = "none";
      options = ["bind" "x-gvfs-hide"];
    };

    "/home/psoewish/.ssh" = {
      depends = ["/data"];
      device = "/data/home/.ssh";
      fsType = "none";
      options = ["bind" "x-gvfs-hide"];
    };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 32 * 1024;
    }
  ];
}
