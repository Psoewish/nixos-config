{...}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    initrd = {
      systemd.enable = true;
      verbose = false;
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
    };
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "8250.nr_uarts=0"
      "console=tty0"
    ];
    consoleLogLevel = 3;
    plymouth.enable = true;
  };
}
