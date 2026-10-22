{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [pkgs.helix];
  hjem.users.psoewish.xdg.config.files = {
    "helix/config.toml".source = lib.mkSymlink ./config/config.toml;
    "helix/languages.toml".source = lib.mkSymlink ./config/languages.toml;
  };
}
