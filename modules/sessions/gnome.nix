{
  flake.modules.nixos.gnome = {pkgs, ...}: {
    services.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = with pkgs; [gnome-tour gnome-user-docs];

    environment.systemPackages =
      (
        with pkgs.gnomeExtensions; [
          caffeine
          appindicator
          dash2dock-lite
          blur-my-shell
          coverflow-alt-tab
          user-themes
          vertical-workspaces
          rounded-window-corners
          paperwm
        ]
      )
      ++ (with pkgs; [gnome-tweaks]);
  };
}
