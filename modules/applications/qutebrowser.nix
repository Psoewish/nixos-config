{
  flake.modules.nixos.qutebrowser = {pkgs, ...}: {
    environment.systemPackages = [pkgs.qutebrowser];
  };
}
