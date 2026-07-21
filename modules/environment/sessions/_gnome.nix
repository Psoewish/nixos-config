{pkgs, ...}: {
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

  environment.systemPackages = (
    with pkgs.gnomeExtensions; [
      caffeine
      appindicator
      blur-my-shell
    ]
  );
}
