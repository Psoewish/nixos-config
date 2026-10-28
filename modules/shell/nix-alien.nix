{
  inputs,
  pkgs,
  ...
}: {
  programs.nix-ld.enable = true;
  home.config.home.packages = [inputs.nix-alien.packages.${pkgs.stdenv.hostPlatform.system}.nix-alien];
}
