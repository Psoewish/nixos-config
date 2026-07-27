{ pkgs, ... }: {
  flake.modules.nixos.gaming = {
    environment.systemPackages = [ pkgs.heroic ];
  };
}
