{
  flake.modules.nixos.pear-desktop = {pkgs, ...}: {
    environment.systemPackages = [pkgs.pear-desktop];
  };
}
