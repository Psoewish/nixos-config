{
  flake.modules.nixos.desktop = {
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = ["/"];
  };
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/36b23ce5-8b0d-452f-b363-94e8548fe1b8";
    fsType = "btrfs";
    options = [
      "subvol=root"
      "compress=zstd"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/36b23ce5-8b0d-452f-b363-94e8548fe1b8";
    fsType = "btrfs";
    options = [
      "subvol=home"
      "compress=zstd"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/36b23ce5-8b0d-452f-b363-94e8548fe1b8";
    fsType = "btrfs";
    options = [
      "subvol=nix"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/games" = {
    device = "/dev/disk/by-uuid/36b23ce5-8b0d-452f-b363-94e8548fe1b8";
    fsType = "btrfs";
    options = [
      "subvol=games"
      "compress=zstd"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C909-FBEB";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/swap" = {
    device = "/dev/disk/by-uuid/36b23ce5-8b0d-452f-b363-94e8548fe1b8";
    fsType = "btrfs";
    options = [
      "subvol=swap"
      "noatime"
    ];
  };
  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 8 * 1024;
    }
  ];
  zramSwap.enable = true;
  systemd.oomd.enable = true;
  };
}
