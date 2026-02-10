{
  username,
  lib,
  config,
  ...
}:
{
  home-manager.users.${username}.programs.noctalia-shell = lib.mkIf config.programs.hyprland.enable {
    enable = true;
  };
}
