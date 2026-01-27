{ username, ... }:
{
  home-manager.users.${username} = {
    programs.ripgrep = {
      enable = true;
      arguments = [
        "--hidden"
        "--smart-case"
      ];
    };
  };
}
