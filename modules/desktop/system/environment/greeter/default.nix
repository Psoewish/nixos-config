{ ... }:
{
  services.gnome.gnome-keyring.enable = true;
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "psoewish";
    };
    gdm.enable = true;
  };

  security = {
    polkit.enable = true;
    pam.services = {
      cosmic-greeter.enableGnomeKeyring = true;
      gdm.enableGnomeKeyring = true;
      greetd.enableGnomeKeyring = true;
      login.enableGnomeKeyring = true;
    };
  };
}
