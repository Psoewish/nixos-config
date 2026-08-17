{
  flake.modules.nixos.fish = {inputs, ...}: {
    programs.fish = {
      enable = true;
      useBabelfish = true;
    };

    home-manager.sharedModules = [inputs.self.modules.homeManager.fish];
  };

  flake.modules.homeManager.fish = {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -gx fish_greeting
        set -gx sponge_purge_only_on_exit true
      '';
    };
  };
}
