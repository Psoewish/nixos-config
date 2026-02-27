{ pkgs, ... }:
{
  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = "psoewish";
      };
      gdm.enable = true;
    };

    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    gnome-text-editor
    gnome-console
    gnome-music
    gnome-software # This auto enables when you enable flatpaks unless excluded
    decibels
    showtime
    epiphany
    simple-scan
    yelp
  ];

  environment.systemPackages =
    (with pkgs.gnomeExtensions; [
      arc-menu
      caffeine
      appindicator
      blur-my-shell
      just-perfection
      gtile
      focus-control
    ])
    ++ (with pkgs; [
      refine
      ignition
      celluloid
      geary
    ]);
}
