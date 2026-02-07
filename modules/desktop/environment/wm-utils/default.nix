{ username, pkgs, ... }:
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
          radius = 2;
          selection-radius = 2;
        };
      };
    };

    home.packages = with pkgs; [
      grimblast
      wl-clipboard
      wl-clip-persist
      cliphist
      hyprcursor
    ];
  };
}
