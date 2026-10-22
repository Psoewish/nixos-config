{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [pkgs.fastfetch];
  hjem.users.psoewish.xdg.config.files = {
    "fastfetch/config.jsonc".source = lib.mkSymlink ./config/config.jsonc;
    "fastfetch/scrioblNixOS.png".source = lib.mkSymlink ./config/scrioblNixOS.png;
  };
}
