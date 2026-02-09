{ modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/c5056b3d-2639-4bab-9ec1-f1b13bfa73ff";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=root" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/c5056b3d-2639-4bab-9ec1-f1b13bfa73ff";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/c5056b3d-2639-4bab-9ec1-f1b13bfa73ff";
      fsType = "btrfs";
      options = [ "compress=zstd" "noatime" "subvol=nix" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/12CE-A600";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ ];
}
