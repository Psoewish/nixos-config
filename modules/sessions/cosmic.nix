{
  flake.modules.nixos.cosmic = {pkgs, ...}: {
    services.desktopManager.cosmic.enable = true;

    environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
    environment.systemPackages = with pkgs; [
      cosmic-ext-applet-privacy-indicator
      cosmic-monitor
      loupe
    ];
  };
}
