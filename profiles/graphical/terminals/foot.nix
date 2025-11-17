{ ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "fish";
        term = "foot"; # test "xterm-256color"
        font = "CaskaydiaCove Nerd Font:size=12";
      };
      cursor = {
        style = "beam";
        blink = "yes";
        blink-rate = 500;
      };
      mouse = {
        hide-when-typing = "yes";
      };
      mouse-bindings = {
        clipboard-copy = "BTN_RIGHT";
        clipboard-paste = "BTN_MIDDLE";
        primary-paste = "Control+BTN_MIDDLE";
        select-extend = "Control+BTN_RIGHT";
        select-extend-character-wise = "Control+Alt+BTN_RIGHT";
      };
    };
  };
}
