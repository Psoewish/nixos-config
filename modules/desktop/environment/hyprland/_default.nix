{ ... }:
{
  # Import modules
  imports = [
    ./config.nix
    ./file-management.nix
    ./utils.nix
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  services.getty.autologinUser = "psoewish";
  programs.fish.loginShellInit = /* fish */ ''
    if test (tty) = "/dev/tty1"; and not set -q WAYLAND_DISPLAY; and uwsm check may-start
        exec uwsm start hyprland.desktop
    end
  '';

  services.gnome.gnome-keyring.enable = true;
  security = {
    polkit.enable = true;
    pam.services.login.enableGnomeKeyring = true;
  };
}
