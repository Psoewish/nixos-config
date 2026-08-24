{
  flake.modules.nixos.umbriel = {
    inputs,
    pkgs,
    ...
  }: {
    imports = with inputs; [
      self.modules.nixos.greeter
      umbriel.nixosModules.default
      noctalia.nixosModules.default
    ];
    nix.settings = {
      extra-substituters = ["https://noctalia.cachix.org"];
      extra-trusted-public-keys = ["noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="];
    };
    programs = {
      umbriel = {
        enable = true;
        portalPackage = inputs.xdg-desktop-portal-umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
      noctalia = {
        enable = true;
        recommendedServices.enable = true;
        systemd.enable = true;
      };
    };
    home-manager.sharedModules = [inputs.self.modules.homeManager.umbriel];
  };

  flake.modules.homeManager.umbriel = {inputs, ...}: {
    imports = with inputs; [
      umbriel.homeModules.default
    ];
    programs.umbriel = {
      enable = true;
      settings = {
        outputs = {
          "DP-1" = {
            mode = "2560x144@144";
            position = [0 1440];
            scale = 1;
            vrr = "always";
            workspaces = 5;
          };
          "DP-2" = {
            mode = "2560x144@60";
            position = [0 0];
            scale = 1;
            vrr = "never";
            workspaces = 1;
          };
        };
        general.autostart = ["noctalia"];
        appearance = {
          border_width = 1;
          corner_radius = 0;
        };
        shadow.enabled = false;
        layout = {
          mode = "dwindle";
          gap = 10;
        };
        focus.follows_mouse = true;

        keybinds = {
          "Mod+Slash" = "spawn:noctalia msg panel-toggle launcher";
          "Mod+Return" = "spawn:ghostty";

          "Mod+Print" = "spawn:noctalia msg screenshot-region";
          "Mod+Shift+Print" = "spawn:noctalia msg screenshot-fullscreen";

          "Mod+Left" = "window-focus-left";
          "Mod+Down" = "window-focus-down";
          "Mod+Up" = "window-focus-up";
          "Mod+Right" = "window-focus-right";

          "Mod+Shift+Left" = "column-move-left";
          "Mod+Shift+Down" = "window-move-down";
          "Mod+Shift+Up" = "window-move-up";
          "Mod+Shift+Right" = "column-move-right";

          "Mod+F" = "window-toggle-maximize";
          "Mod+Shift+F" = "window-toggle-fullscreen";

          "Mod+1" = "workspace-switch:1/DP-1";
          "Mod+2" = "workspace-switch:2/DP-1";
          "Mod+3" = "workspace-switch:3/DP-1";
          "Mod+4" = "workspace-switch:4/DP-1";
          "Mod+5" = "workspace-switch:1/DP-2";

          "Mod+Shift+1" = "window-move-to-workspace:1/DP-1";
          "Mod+Shift+2" = "window-move-to-workspace:2/DP-1";
          "Mod+Shift+3" = "window-move-to-workspace:3/DP-1";
          "Mod+Shift+4" = "window-move-to-workspace:4/DP-1";
          "Mod+Shift+5" = "window-move-to-workspace:1/DP-2";
        };
      };
    };
  };
}
