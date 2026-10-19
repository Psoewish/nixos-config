{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [inputs.deploy-rs.packages.${pkgs.stdenv.hostPlatform.system}.default];
  nixpkgs.overlays = [
    inputs.deploy-rs.overlays.default
    (self: super: {
      deploy-rs = {
        inherit (pkgs) deploy-rs;
        lib = super.deploy-rs.lib;
      };
    })
  ];
}
