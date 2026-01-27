{ username, ... }:
{
  home-manager.users.${username}.programs.foot = {
    enable = true;
    server.enable = true;
  };
}
