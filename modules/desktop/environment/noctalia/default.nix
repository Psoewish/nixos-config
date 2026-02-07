{ username, ... }:
{
  home-manager.users.${username}.programs.noctalia-shell = {
    enable = true;
  };
}
