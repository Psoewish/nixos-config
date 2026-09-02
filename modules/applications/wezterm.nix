{
  flake.modules.nixos.wezterm = {pkgs, ...}: {
    environment.systemPackages = [pkgs.wezterm];
  };
}
