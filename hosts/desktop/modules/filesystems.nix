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
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 32 * 1024;
    }
  ];
}
