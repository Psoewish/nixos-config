toplevel @ {...}: {
  flake.modules.nixos.foot = {
    home-manager.sharedModules = [toplevel.inputs.self.modules.homeManager.foot];
  };
  flake.modules.homeManager.foot = {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          bold-text-in-bright = "yes";
          pad = "10x10 center";
        };
        cursor = {
          style = "beam";
          blink = "no";
        };
      };
    };
  };
}
