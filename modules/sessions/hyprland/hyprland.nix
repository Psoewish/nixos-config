toplevel @ {...}: {
  flake.modules.nixos.hyprland = {pkgs, ...}: {
    imports = with toplevel.inputs.self.modules.nixos; [ironbar fuzzel];
    home-manager.sharedModules = [toplevel.inputs.self.modules.homeManager.hyprland];
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    environment.systemPackages = with pkgs; [nautilus hyprshot];
    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "foot";
    };

    services = {
      gnome.gnome-keyring.enable = true;
      gvfs.enable = true;
      tumbler.enable = true;
      udisks2 = {
        enable = true;
        mountOnMedia = true;
      };
    };

    security = {
      polkit.enable = true;
      pam.services.login.enableGnomeKeyring = true;
    };
  };

  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      extraLuaFiles = {
        autostart.content = ./config/autostart.lua;
        keybinds.content = ./config/keybinds.lua;
        layouts.content = ./config/layouts.lua;
        outputs.content = ./config/outputs.lua;
        rules.content = ./config/rules.lua;
        settings.content = ./config/settings.lua;
        style.content = ./config/style.lua;
        vars = {
          autoLoad = false;
          content = ./config/vars.lua;
        };
      };
    };
    programs.noctalia.enable = true;
  };
}
