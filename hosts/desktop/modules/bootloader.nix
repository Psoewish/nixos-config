{
  flake.modules.nixos.desktop = {pkgs, ...}: {
    boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

    boot.loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    boot.initrd = {
      systemd.enable = true;
      verbose = false;
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
    };

    boot.consoleLogLevel = 3;
  };
}
