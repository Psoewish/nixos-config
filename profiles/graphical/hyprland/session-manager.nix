{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings.initial_session = {
      command = "${pkgs.uwsm}/bin/uwsm start hyprland-uwsm.desktop";
      user = "psoewish";
    };
  };

  programs.regreet = {
    enable = true;
    cageArgs = [
      "-s"
      "-m"
      "DP-1"
    ];
  };

  services.gnome.gnome-keyring.enable = true;

  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };
}
