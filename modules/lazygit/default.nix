{ username, ... }:
{
  fractal.tags = [ "desktop" ];
  home-manager.users.${username} = {
    programs = {
      lazygit = {
        enable = true;
      };
    };
  };
}
