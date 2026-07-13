{ pkgs, ... }:
{
  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = "psoewish";
      };
      cosmic-greeter.enable = true;
    };

    desktopManager.cosmic.enable = true;
  };

  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  environment.systemPackages = with pkgs; [
    cosmic-ext-calculator
    cosmic-ext-applet-caffeine
    cosmic-ext-applet-privacy-indicator
    cosmic-monitor
    loupe
  ];
}
