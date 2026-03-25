{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    inputs.affinity.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
