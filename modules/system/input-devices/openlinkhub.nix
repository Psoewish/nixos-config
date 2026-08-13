{
  flake.modules.nixos.openlinkhub = {inputs, ...}: {
    nixpkgs.overlays = [(inputs.openlinkhub.overlays.default or {})];
    imports = [inputs.openlinkhub.nixosModules.openlinkhub];

    services.hardware.openlinkhub.enable = true;
  };
}
