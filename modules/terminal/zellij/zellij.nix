{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [zellij];
  hjem.users.psoewish.xdg.config.files = {
    "zellij/config.kdl".source = lib.mkSymlink ./config/config.kdl;
    "zellij/layouts".source = lib.mkSymlink ./config/layouts;
  };
}
