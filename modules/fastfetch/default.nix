{ username, ... }:
{
  fractal.tags = [ "core" ];
  home-manager.users.${username} = {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          type = "data";
          source = ''
              ⠀⠀⠀⠀$1⢀⣠⣤⣤⣤⣀⠀⠀⠀⠀⣀⣠⣤⣤⣤⣄⡀⠀⠀⠀⠀⠀
              ⠀$1⠀⣠⣿⠿⠛⠛⠛⠛⠛⢿⣷⣤⣾⠿⠛⠛⠙⠛⠛⠿⠗⠀⠀⠀⠀           $4⢀
              ⠀$1⣾⡿⠁⠀⠀⠀⠀⠀⠀⠀⠙⡿⠁⠀$2⢀⣤⣀⠀⠀⢀⣤⣶⡆⠀  $2⠈⠁⠀⠀$4⢦⣤⣿⣀⡀⠀
              $1⢸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀$2⠈⣿⣿⣿⣿⣿⣿⣿⡇⠀ $5⡀⡀⠀⠀⠀$4⣰⠿⢿⡏⠁⠀
              $1⠸⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀$2⣸⣿⣿⣿⣿⣿⣿⣧⣄⠀$5⠚⠏⠀⠀⠀⠀⠀⠀$4⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
              ⠀$1⢹⣿⠀$3⣿⣷⣄⣀⣤⡄⠀⠀⠀⠀$2⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⠷⠀⠀⠀⠀⠀⠀⠀$3⣼⢿⡀⠀⠀⠀⠀⣤⠀⠀⠀
              ⠀⠀$3⣁⣤⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀$2⠘⠛⠛⠛⠻⣿⣿⣿⠋⠉⠀⠀⠀⠀$3⣤⣤⣤⣀⣸⠏⠘⣧⠀⠀⠀⠀⠁⠀⠀⠀
              ⠀$3⠘⠻⢿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀$1⢀⡀$2⠹⣿⡟⠀⠀⠀⠀⠀⠀$3⠈⠛⢦⡀⠈⠀⠀⠙⢛⣿⡿⠂⠀⠀⠠⠄
              ⠀⠀⠀⠀$3⢹⣿⠟⢙⠛⠛⠀⠀⠀⠀⠀$1⣀⣴⡿⠓⠀⠀⠀⠀⠀⠀⠀$3⠦⠀⠀⠀⣰⡏⠀⣀⠀⢸⡏⠁⠀⠀⠀⠀⠀⠀
              ⠀⠀⠀⠀$3⠈⠁⠀$1⠈⠻⢿⣦⣄⠀⣠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀$3⢠⣿⡶⠟⠙⢷⣄⣇⠀⠀⠰⣶⣿⣀⠀
              ⠀⠀⠀⠀$5⡄⠀⠀⠀⠀⠀$1⠙⢿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀$3⠈⠁⠀⠀⠀⠀⠈⠛⠀⠀⠚⠛⠿⠀⠀
              ⠀⠀⠀$5⢰⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀$2⣠⣤⣤⣄⣀⣀⠀⠀⠀⠀⠀⡀
                 $5⢸⡏⢿⡄            ⠀$2⠰⠀⠀⠀⠀⢀⣿⠛⠛⠻⠿⣿⣿⣷⡄⠀⠀⠁
            $5⢀⣀⣠⣤⡤⠿⠀⠈⠿⠛⢛⣿⠟        ⠀⠀⠀$2⠀⣀⡀⢸⡏⠀⠀⠀⠀⠀⣼⡿⠁⠀⠀⠀
            ⠀$5⠉⠳⢦⣤⡀⠀⠀⠀⢰⡟⠁          ⠀⠀$2⢸⣿⣿⣿⠁⠀⢀⣀⠀⢠⣿⠃⠀⠀⠀⠀
             ⠀⠀⠀$5⣸⠃⢀⣤⣄⡈⣷⡀  ⠀$1⣽⠿⠿⠿⣿⣶⣶⡆⠀$2⠘⠿⠿⠋⠀⠀⢻⣿⣿⣿⡏⠀⠀⠀⠘⠀
             ⠀⠀⠀$5⣿⡴⠛⠁⠉⠛⠾⣧  $1⢰⡟⠀⠀⠀⠀⠀⣸⡇⠀⠀⠀⠀⠀⠀⠀$2⠈⠛⠛⠋⠀⠀⠀⠀⠀⠀
                      ⠀⠀⠀⠀$1⣾⠁⠀⠀⠀⠀⠀⣿⠇⠀⠀⠀
                      ⠀$1⣴⣶⣾⡏⠀⠀⠀⣀⡀⢠⡿⠀⠀⠀⠀
                      ⠀$1⠻⣿⡿⠃⠀⠀⢺⣿⣿⣿⠃
                      ⠀⠀⠀⠀⠀⠀⠀$1⠈⠙⠋⠁⠀
          '';
          color = {
            "1" = "red";
            "2" = "cyan";
            "3" = "yellow";
            "4" = "magenta";
            "5" = "green";
          };
        };
        display = {
          separator = "";
          constants = [
            (builtins.fromJSON ''"\u001b[89G│\u001b[55G  "'')
          ];
        };
        modules = [
          {
            type = "custom";
            key = "╭─────── ⋅ ⋅ ───── ✩ ───── ⋅ ⋅ ───────╮";
          }
          # hardware block
          {
            type = "board";
            key = "├  {$1}";
            format = "{name}";
          }
          {
            type = "cpu";
            key = "├  {$1}";
            format = "{name}";
          }
          {
            type = "gpu";
            key = "├  {$1}";
            format = "{name}";
          }
          {
            type = "memory";
            key = "├  {$1}";
            format = "{used}/{total} ({percentage})";
          }
          {
            type = "disk";
            key = "├  {$1}";
            format = "{size-used}/{size-total} ({size-percentage})";
          }
          {
            type = "custom";
            key = "╰─────── ⋅ ⋅ ───── ✩ ───── ⋅ ⋅ ───────╯";
          }
          "break"
          {
            type = "custom";
            key = "╭─────── ⋅ ⋅ ───── ✩ ───── ⋅ ⋅ ───────╮";
          }
          # os block
          {
            type = "os";
            key = "├ 󱄅 {$1}";
            format = "{name} {version}";
          }
          {
            type = "kernel";
            key = "├  {$1}";
            format = "{sysname} {release}";
          }
          {
            type = "uptime";
            key = "├  {$1}";
            format = "{formatted}";
          }
          {
            type = "custom";
            key = "╰─────── ⋅ ⋅ ───── ✩ ───── ⋅ ⋅ ───────╯";
          }
          "break"
          {
            type = "custom";
            key = "╭─────── ⋅ ⋅ ───── ✩ ───── ⋅ ⋅ ───────╮";
          }
          # software block
          {
            type = "wm";
            key = "├ 󰝘 {$1}";
            format = "{pretty-name} {version}";
          }
          {
            type = "terminal";
            key = "├  {$1}";
            format = "{pretty-name} {version}";
          }
          {
            type = "shell";
            key = "├  {$1}";
            format = "{pretty-name} {version}";
          }
          {
            type = "terminalfont";
            key = "├  {$1}";
            format = "{name}";
          }
          {
            type = "cursor";
            key = "├ 󰇀 {$1}";
            format = "{theme}";
          }
          {
            type = "custom";
            key = "╰─────── ⋅ ⋅ ───── ✩ ───── ⋅ ⋅ ───────╯";
          }
          "break"
          {
            type = "colors";
            symbol = "circle";
            paddingLeft = 12;
          }
        ];
      };
    };
  };
}
