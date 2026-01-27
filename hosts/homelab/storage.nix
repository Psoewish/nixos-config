{ modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/ad374118-5ab8-4e31-97f9-0e5e8f9de75b";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/5582-FDA7";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/4071aba9-4533-4819-b234-a8903e58a990"; } ];

  services.zfs = {
    autoScrub.enable = true;
    autoScrub.interval = "monthly";
    trim.enable = true;
  };

  networking.hostId = "f46ba50b";
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.extraPools = [
    "speedy"
    "rusty"
  ];
  boot.zfs.forceImportRoot = false;
}
