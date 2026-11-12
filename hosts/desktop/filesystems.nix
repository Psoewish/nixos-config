{
  fileSystems = {
    # OS drive (1TB nvme)
    "/boot" = {
      device = "/dev/disk/by-uuid/DD85-64A8";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/" = {
      device = "/dev/disk/by-uuid/1f85930f-d22e-41f4-a0f4-868dee3eb3e3";
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
