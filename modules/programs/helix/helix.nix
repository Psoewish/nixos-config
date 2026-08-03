{
  flake.modules.nixos.helix = {inputs, ...}: {
    home-manager.sharedModules = [inputs.self.modules.homeManager.helix];
  };

  flake.modules.homeManager.helix = {
    programs.helix = {
      enable = true;
      defaultEditor = true;
    };
  };
}
