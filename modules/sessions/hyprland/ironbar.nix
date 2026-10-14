toplevel @ {...}: {
  flake.modules.nixos.ironbar = {
    home-manager.sharedModules = [toplevel.inputs.self.modules.homeManager.ironbar];
  };
  flake.modules.homeManager.ironbar = {
    imports = [toplevel.inputs.ironbar.homeManagerModules.default];
    programs.ironbar = {
      enable = true;
      systemd = true;
      config = {
        monitors = {
          DP-1 = {
            position = "top";
            height = 16;
            margin.left = 10;
            margin.top = 10;
            margin.right = 10;
            start = [
              {type = "workspaces";}
            ];
            center = [
              {type = "clock";}
            ];
            end = [
              {type = "tray";}
            ];
          };
          DP-2 = [];
        };
      };
    };
  };
}
