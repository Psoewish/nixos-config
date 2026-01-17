{ username, ... }:
{
  home-manager.users.${username}.programs.rio = {
    enable = true;
    settings = {
      confirm-before-quit = false;
    };
  };
}
