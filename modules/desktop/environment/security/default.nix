{ ... }:
{
  services.gnome.gnome-keyring.enable = true;
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "psoewish";
    };
    cosmic-greeter.enable = true;
  };

  security = {
    polkit.enable = true;
    pam.services = {
      gdm.enableGnomeKeyring = true;
      cosmic-greeter.enableGnomeKeyring = true;
      greetd.enableGnomeKeyring = true;
      login.enableGnomeKeyring = true;
    };
  };
}
