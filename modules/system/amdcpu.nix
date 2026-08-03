{
  flake.modules.nixos.amdcpu = {lib, ...}: {
    hardware.cpu.amd.updateMicrocode = lib.mkDefault true;
    boot.kernelModules = ["kvm-amd"];
  };
}
