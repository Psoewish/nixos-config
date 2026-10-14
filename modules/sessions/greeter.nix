toplevel @ {...}: {
  flake.modules.nixos.greeter = {
    services.getty.autologinUser = toplevel.config.flake.meta.primaryUser.username;
    environment.loginShellInit = ''
      if uwsm check may-start; then
        exec uwsm start hyprland.desktop
      fi
    '';
  };
}
