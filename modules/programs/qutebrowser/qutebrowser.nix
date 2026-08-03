{
  flake.modules.nixos.qutebrowser = {inputs, ...}: {
    home-manager.sharedModules = [inputs.self.modules.homeManager.qutebrowser];
  };

  flake.modules.homeManager.qutebrowser = {
    programs.qutebrowser.enable = true;
  };
}
