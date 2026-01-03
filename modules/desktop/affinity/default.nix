{ inputs, pkgs, ... }:
{
  environment.systemPackages = [
    inputs.affinity.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
