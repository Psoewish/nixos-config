{ inputs, pkgs, ... }:
{
  # Import nixos modules
  imports = with inputs; [ noctalia.nixosModules.default ];

  # Set up autostart + login/keyring
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

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
  };

  # Enable Noctalia
  services.noctalia-shell.enable = true;

  # Thunar setup
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-volman
      thunar-vcs-plugin
      thunar-archive-plugin
    ];
  };
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };
  };

  # Set up some misc utilities
  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };
  programs = {
    gpu-screen-recorder.enable = true;
    kdeconnect.enable = true;
  };
  environment.systemPackages = with pkgs; [
    wl-clipboard-rs
    wl-clip-persist
    cliphist
    hyprshot
    hyprcursor
  ];
}
