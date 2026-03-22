{ username, ... }:
{
  home-manager.users.${username}.xsession.windowManager.bspwm = {
    enable = true;
    monitors = {
      DP-1 = [
        "1"
        "2"
        "3"
        "4"
      ];
      DP-2 = [
        "5"
      ];
    };
    startupPrograms = [ ];
    settings = {
      border_width = 1;
      window_gap = 10;
      split_ratio = 0.5;
      borderless_monocle = false;
      gapless_monocle = false;
    };
    rules = {
      "vesktop".desktop = "^5";
      "pear-desktop".desktop = "^5";
    };
  };
}
