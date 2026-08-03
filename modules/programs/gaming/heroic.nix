{
  flake.modules.nixos.gaming = {pkgs, ...}: {
    environment.systemPackages = [pkgs.heroic];
  };
}
