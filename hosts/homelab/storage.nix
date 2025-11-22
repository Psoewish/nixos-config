{ modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/6f4baa10-8da6-4eb3-93a7-3999057f6cae";
    fsType = "btrfs";
    options = [ "subvol=root" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/6f4baa10-8da6-4eb3-93a7-3999057f6cae";
    fsType = "btrfs";
    options = [ "subvol=home" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/6f4baa10-8da6-4eb3-93a7-3999057f6cae";
    fsType = "btrfs";
    options = [ "subvol=nix" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/EBE6-B2CA";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/var/lib" = {
    device = "/dev/disk/by-uuid/b11cf58f-4835-464f-b052-d5c39ae61d7a";
    fsType = "btrfs";
  };

  fileSystems."/data" = {
    device = "tank";
    fsType = "zfs";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/55566de6-1ff4-4554-878d-07c371712fbf"; }
  ];

  services.zfs = {
    autoScrub.enable = true;
    autoScrub.interval = "monthly";
    trim.enable = true;
  };

  networking.hostId = "f46ba50b";
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;
}
