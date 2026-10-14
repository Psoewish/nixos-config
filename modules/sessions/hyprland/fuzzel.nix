toplevel @ {...}: {
  flake.modules.nixos.fuzzel = {
    home-manager.sharedModules = [toplevel.inputs.self.modules.homeManager.fuzzel];
  };
  flake.modules.homeManager.fuzzel = {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          terminal = "foot";
          output = "DP-1";
          launch-prefix = "uwsm app --";
          width = 40;
          lines = 10;
          exit-on-keyboard-focus-loss = false;
          use-bold = true;
        };
        border = {
          radius = 0;
        };
      };
    };
  };
}
