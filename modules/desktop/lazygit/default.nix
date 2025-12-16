{ username, ... }:
{
  home-manager.users.${username} = {
    programs = {
      lazygit = {
        enable = true;
      };
    };
  };
}
