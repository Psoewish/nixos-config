{
  flake.modules.homeManager.cli-tools = { config, ... }: {
    programs = {
      git = {
        enable = true;
        settings.user = {
          name = "${config.constants.primaryUser}";
          email = "personal@psoewish.com";
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
