{
  flake.modules.nixos.cosmic = {
    inputs,
    pkgs,
    ...
  }: {
    imports = [inputs.self.modules.nixos.greeter];

    services.desktopManager.cosmic.enable = true;

    environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
    environment.systemPackages = with pkgs; [
      cosmic-ext-calculator
      cosmic-ext-applet-caffeine
      cosmic-ext-applet-privacy-indicator
      cosmic-monitor
      loupe
    ];
  };
}
