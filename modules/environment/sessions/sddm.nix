{...}: {
  services.displayManager = {
    autoLogin = {
      enable = false;
      user = "psoewish";
    };
    # plasma, cosmic, gnome, kineticWE, hyprland, mango
    defaultSession = "hyprland";
    plasma-login-manager.enable = true;
  };
}
