{ ... }:
{
  services.gnome.gnome-keyring.enable = true;

  programs.regreet = {
    enable = true;
    cageArgs = [
      "-s"
      "-m"
      "last"
    ];
  };

  security = {
    polkit.enable = true;
    pam.services = {
      greetd.enableGnomeKeyring = true;
      login.enableGnomeKeyring = true;
    };
  };
}
