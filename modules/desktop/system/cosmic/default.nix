{ pkgs, ... }:
{
  services.desktopManager.cosmic.enable = true;
  services.system76-scheduler.enable = true;
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  environment.systemPackages = with pkgs; [
    cosmic-ext-applet-caffeine
    cosmic-ext-tweaks
    cosmic-ext-applet-privacy-indicator
  ];
}
