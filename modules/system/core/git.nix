toplevel @ {config,...}:{
  flake.modules.homeManager.core = {
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
