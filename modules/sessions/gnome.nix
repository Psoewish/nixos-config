{
  flake.modules.nixos.gnome = {pkgs, ...}: {
    services.desktopManager.gnome.enable = true;

    environment.systemPackages = (
      with pkgs.gnomeExtensions; [
        caffeine
        appindicator
      ]
    );
  };
}
