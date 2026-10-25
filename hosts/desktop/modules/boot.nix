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

    consoleLogLevel = 3;
  };
}
