{ pkgs, ... }:
{
  services.desktopManager.gnome.enable = true;
  services.gnome.gnome-browser-connector.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    gnome-text-editor
    gnome-terminal
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
