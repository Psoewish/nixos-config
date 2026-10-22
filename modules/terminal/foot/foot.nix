{lib, ...}: {
  programs.foot = {
    enable = true;
    xdg.serverAutostart = true;
  };

  hjem.users.psoewish.xdg.config.files = {
    "foot/foot.ini".source = lib.mkSymlink ./config/foot.ini;
  };
}
