{ modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/36b23ce5-8b0d-452f-b363-94e8548fe1b8";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/36b23ce5-8b0d-452f-b363-94e8548fe1b8";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/36b23ce5-8b0d-452f-b363-94e8548fe1b8";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/games" =
    { device = "/dev/disk/by-uuid/36b23ce5-8b0d-452f-b363-94e8548fe1b8";
      fsType = "btrfs";
      options = [ "subvol=games" "compress=zstd" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/C267-9992";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ ];
}
