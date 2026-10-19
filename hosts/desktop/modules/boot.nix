{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelModules = ["kvm-amd"];

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    initrd = {
      systemd.enable = true;
      verbose = false;
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
    };

    consoleLogLevel = 3;
  };
}
