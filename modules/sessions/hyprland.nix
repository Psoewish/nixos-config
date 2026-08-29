{
  flake.modules.nixos.hyprland = {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    programs.noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };

    services = {
      gnome.gnome-keyring.enable = true;
      gvfs.enable = true;
      tumbler.enable = true;
      udisks2 = {
        enable = true;
        mountOnMedia = true;
      };
      power-profiles-daemon.enable = true;
    };

    security = {
      polkit.enable = true;
      pam.services.login.enableGnomeKeyring = true;
    };
  };
}
