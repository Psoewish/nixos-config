{
  home.config.programs = {
    git = {
      enable = true;
      settings = {
        init = {
          defaultBranch = "main";
        };
        user = {
          name = "psoewish";
          email = "personal@psoewish.com";
        };
      };
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
    lazygit = {
      enable = true;
      settings = {
        border = "single";
        git.diffRenderers = [
          {
            command = "delta --paging=never";
          }
        ];
      };
    };
    delta = {
      enable = true;
      enableGitIntegration = true;
    };
  };
}
