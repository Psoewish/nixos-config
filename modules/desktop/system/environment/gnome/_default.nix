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
      all-in-one-clipboard
      tiling-shell
      extension-list
      removable-drive-menu
      dash2dock-lite
      appindicator
      blur-my-shell
      arc-menu
      fuzzy-app-search
      gnome-40-ui-improvements
    ])
    ++ (with pkgs; [
      gnome-tweaks
      rewaita
    ]);

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
