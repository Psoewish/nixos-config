{
  flake.modules.nixos.desktop = {
    inputs,
    pkgs,
    ...
  }: {
    nixpkgs.overlays = [inputs.cachy-kernel.overlays.pinned];
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    services.scx = {
      enable = true;
      scheduler = "scx_lavd";
      extraArgs = ["--performance"];
    };

    boot.kernelParams = [
      "quiet"
      "udev.log_level=3"
      "8250.nr_uarts=0"
      "console=tty0"
    ];

    boot.loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    boot.initrd = {
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

    boot.consoleLogLevel = 3;
    boot.plymouth.enable = true;
  };
}
