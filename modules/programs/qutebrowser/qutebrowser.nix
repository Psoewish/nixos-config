{ inputs, ... }: {
  flake.modules.nixos.helium = {
    home-manager.sharedModules = [ inputs.self.modules.homeManager.qutebrowser ];
  };

  flake.modules.homeManager.qutebrowser = {
    programs.qutebrowser.enable = true;
  };
}
