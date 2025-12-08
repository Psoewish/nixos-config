{ username, ... }:
{
  home-manager.users.${username} = {
    programs.wezterm = {
      enable = true;
    };
  };
}
