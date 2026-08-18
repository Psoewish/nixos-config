toplevel @ {
  config,
  inputs,
  ...
}: {
  flake.modules.nixos.git = {
    home-manager.sharedModules = [inputs.self.modules.homeManager.git];
  };

  flake.modules.homeManager.git = {
    programs = {
      git = {
        enable = true;
        settings.user = {
          name = "psoewish";
          email = "${toplevel.config.global.personal.email}";
        };
      };
      gh = {
        enable = true;
        settings = {
          git_protocol = "ssh";
          aliases = {
            ga = "git add -A";
            gc = "git commit -m";
            gp = "git push";
          };
        };
      };
      lazygit.enable = true;
    };
  };
}
