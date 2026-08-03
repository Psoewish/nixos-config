{
  flake-file.inputs.nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

  flake.modules.nixos.boot =
    {
      inputs,
      lib,
      pkgs,
      ...
    }:
    {
      nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];

      boot.kernelPackages = lib.mkDefault pkgs.cachyosKernels.linuxPackages-cachyos-lts;
      boot.kernelParams = lib.mkDefault [
        "quiet"
        "udev.log_level=3"
        "8250.nr_uarts=0"
        "console=tty0"
      ];

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

      hardware.enableRedistributableFirmware = true;
    };
}
