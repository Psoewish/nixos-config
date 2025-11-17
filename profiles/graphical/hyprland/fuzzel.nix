{ username, ... }:
{

  home-manager.users.${username} = {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          output = "DP-1";
          terminal = "ghostty -e {cmd}";
          launch-prefix = "uwsm app --";
          width = 50;
        };
        border = {
          radius = 8;
          selection-radius = 8;
        };
      };
    };
  };
}
