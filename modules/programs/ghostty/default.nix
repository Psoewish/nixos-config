{
  flake.modules.nixos.ghostty = {inputs, ...}: {
    home-manager.sharedModules = [inputs.self.modules.homeManager.ghostty];
  };

  flake.modules.homeManager.ghostty = {
    programs.ghostty = {
      enable = true;
      systemd.enable = true;
    };
  };
}
