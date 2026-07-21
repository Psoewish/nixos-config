{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages;
    kernelModules = ["kvm-intel"];
  };
}
