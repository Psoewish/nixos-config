{ ... }:
{
  fractal.tags = [ "desktop" ];
  services.displayManager = {
    gdm = {
      enable = true;
      wayland = true;
    };
    autoLogin = {
      enable = true;
      user = "psoewish";
    };
    defaultSession = "hyprland-uwsm";
  };

  services.gnome.gnome-keyring.enable = true;

  security.pam.services = {
    gdm.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };
}
