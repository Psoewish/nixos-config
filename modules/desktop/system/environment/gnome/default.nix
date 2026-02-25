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
    epiphany
    simple-scan
    yelp
  ];

  environment.systemPackages =
    (with pkgs.gnomeExtensions; [
      caffeine
      tiling-shell
      removable-drive-menu
      dash2dock-lite
      appindicator
      blur-my-shell
      gnome-40-ui-improvements
    ])
    ++ (with pkgs; [
      refine
      ignition
      ulauncher
      gnome-extension-manager
      gnome-multi-writer
      gnome-decoder
      cartridges
      boatswain
    ]);
}
