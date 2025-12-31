{ pkgs, ... }:
{
  fractal.tags = [ "homelab" ];
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };
    initrd = {
      enable = true;
      systemd.enable = true;
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
    consoleLogLevel = 3;
    kernelPackages = pkgs.linuxPackages;
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };
}
