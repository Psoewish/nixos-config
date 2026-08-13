{
  flake.modules.nixos.helium = {inputs, ...}: {
    home-manager.sharedModules = [inputs.self.modules.homeManager.helium];
  };

  flake.modules.homeManager.helium = {inputs, ...}: {
    imports = [(inputs.helium.homeModules.default or {})];

    programs.helium = {
      enable = true;
      flags = ["--show-avatar-button=never"];
    };
  };
}
