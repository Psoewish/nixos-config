{ pkgs, ... }:
{
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
      kernelModules = [ ];
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
    };
    consoleLogLevel = 3;
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };
  services.scx.enable = true;
}
