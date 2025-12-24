{ ... }:
{
  services.xserver = {
    enable = true;
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
      autoLogin = {
        enable = true;
        user = "psoewish";
      };
    };
  };
  services.displayManager = {
    defaultSession = "hyprland-uwsm";
  };
  security.pam.services = {
    gdm.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };
}
