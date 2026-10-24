{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [pkgs.zed-editor];

  hjem.users.psoewish.xdg.config.files = {
    "zed/settings.json".source = lib.mkSymlink ./config/settings.json;
    "zed/keymap.json".source = lib.mkSymlink ./config/keymap.json;
  };
}
