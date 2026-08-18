{
  flake.modules.nixos.homelab = {
    config,
    pkgs,
    ...
  }: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime
        vpl-gpu-rt
      ];
    };
    boot.kernelModules = ["kvm-intel"];
    hardware.enableAllFirmware = true;
    hardware.cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
  };
}
