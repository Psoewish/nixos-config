{ ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        include = "~/.config/foot/themes/noctalia";
        font = "Maple Mono NF CN:size=12";
      };
    };
  };
}
