{ username, ... }:
{
  fractal.tags = [ "desktop" ];
  home-manager.users.${username} = {
    programs.direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };
}
