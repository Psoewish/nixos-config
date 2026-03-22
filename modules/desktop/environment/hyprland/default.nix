{ pkgs, ... }:
{
  imports = [ ./config.nix ];

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

  services = {
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };
    power-power-profiles-daemon.enable = true;
  };

  security = {
    polkit.enable = true;
    pam.services.login.enableGnomeKeyring = true;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard-rs
    wl-clip-persist
    cliphist
    hyprshot
    hyprcursor
    fuzzel
    nautilus
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ghostty";
  };
}
