{ pkgs, ... }:
{
  services.desktopManager.gnome.enable = true;
  services.gnome.gnome-browser-connector.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  environment.systemPackages =
    (with pkgs.gnomeExtensions; [
      arc-menu
      caffeine
      clipboard-indicator
      emoji-copy
      extension-list
      removable-drive-menu
      dash2dock-lite
      appindicator
      screentospace
      smart-auto-move-ng
      tiling-assistant
    ])
    ++ (with pkgs; [
      refine
      adwsteamgtk
    ]);

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
