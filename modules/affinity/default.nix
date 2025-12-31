{ inputs, pkgs, ... }:
{
  fractal.tags = [ "desktop" ];

  environment.systemPackages = [
    inputs.affinity.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
