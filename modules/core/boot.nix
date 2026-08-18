{
  flake.modules.nixos.boot = {
    lib,
    pkgs,
    ...
  }: {
    boot.kernelPackages = lib.mkDefault pkgs.linuxPackages;
    boot.kernelParams = lib.mkDefault [
      "quiet"
      "udev.log_level=3"
      "8250.nr_uarts=0"
      "console=tty0"
    ];
    hardware.enableAllFirmware = true;

    boot.loader = {
      systemd-boot.enable = lib.mkDefault true;
      systemd-boot.configurationLimit = lib.mkDefault 5;
      efi.canTouchEfiVariables = lib.mkDefault true;
      timeout = lib.mkDefault 0;
    };

    boot.initrd = {
      systemd.enable = lib.mkDefault true;
      verbose = lib.mkDefault false;
      availableKernelModules = lib.mkDefault [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
    };

    boot.consoleLogLevel = lib.mkDefault 3;
    boot.plymouth.enable = lib.mkDefault true;
  };
}
