{
  hm.programs = {
    git = {
      enable = true;
      config = {
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
    lazygit.enable = true;
  };
}
