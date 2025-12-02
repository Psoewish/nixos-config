{ inputs, pkgs, ... }:
{
  environment.systemPackages = [ inputs.nilla.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
