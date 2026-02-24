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
  ];

  environment.systemPackages =
    (with pkgs.gnomeExtensions; [
      caffeine
      tiling-shell
      extension-list
      removable-drive-menu
      dash2dock-lite
      appindicator
      blur-my-shell
      fuzzy-app-search
      gnome-40-ui-improvements
    ])
    ++ (with pkgs; [
      refine
      ignition
    ]);

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
