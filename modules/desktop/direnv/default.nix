{ username, ... }:
{
  home-manager.users.${username} = {
    programs.direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };
}
