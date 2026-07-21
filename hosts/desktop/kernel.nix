{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = ["kvm-amd"];
  };

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    extraArgs = ["--performance"];
  };
}
