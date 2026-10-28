{
  home.config.programs.foot = {
    enable = true;
    settings = {
      main = {
        include = "~/.config/foot/themes/noctalia";
        initial-color-theme = "dark";
        bold-text-in-bright = true;
        dpi-aware = false;
        font = "Maple Mono NF CN:size=11";
        pad = "10x10 center";
      };
      colors-dark = {
        alpha = 0.85;
      };
      cursor = {
        blink = false;
        style = "beam";
      };
    };
  };
}
