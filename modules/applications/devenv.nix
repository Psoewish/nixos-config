{
  flake.modules.nixos.devenv = {pkgs, ...}: {
    environment.systemPackages = [pkgs.devenv];
  };
}
