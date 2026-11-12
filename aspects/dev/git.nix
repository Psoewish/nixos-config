{
  den.aspects.dev.git = {
    homeManager = {
      programs = {
        git = {
          enable = true;
          settings = {
            push.autoSetupRemote = true;
            init.defaultBranch = "main";
            user = {
              name = "psoewish";
              email = "personal@psoewish.com";
            };
          };
        };
        gh = {
          enable = true;
          settings.git_protocol = "ssh";
        };
        lazygit = {
          enable = true;
          settings.border = "single";
        };
      };
    };
  };
}
