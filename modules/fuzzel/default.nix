{ username, ... }:
{
  fractal.tags = [ "desktop" ];
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
          radius = 0;
          selection-radius = 8;
        };
        colors = {
          background = "#191724ff";
          text = "#e0def4ff";
          prompt = "#e0def4ff";
          placeholder = "#6e6a86ff";
          input = "#e0def4ff";
          match = "#ebbcbaff";
          selection = "#403d52ff";
          selection-text = "#e0def4ff";
          selection-match = "#ebbcbaff";
          counter = "#f6c177ff";
          border = "#ebbcbaff";
        };
      };
    };
  };
}
