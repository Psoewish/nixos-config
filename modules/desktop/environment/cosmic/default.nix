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
    flatpak.enable = true;
  };

  environment = {
    sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

    systemPackages = with pkgs; [
      # Cosmic tweaks/utils/applets
      cosmic-ext-tweaks
      cosmic-ext-calculator
      cosmic-ext-applet-weather
      cosmic-ext-applet-caffeine
      cosmic-ext-applet-privacy-indicator

      # Random apps made for cosmic
      bazaar
      tasks
      forecast
      quick-webapps
    ];
  };
}
