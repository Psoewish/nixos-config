{
  flake-file.inputs = {
    openlinkhub.url = "github:skelettor/nix-openlinkhub";
    openlinkhub.inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.nixos.corsair = {inputs, ...}: {
    nixpkgs.overlays = [(inputs.openlinkhub.overlays.default or {})];
    imports = [inputs.openlinkhub.nixosModules.openlinkhub];

    services.hardware.openlinkhub.enable = true;
  };
}
