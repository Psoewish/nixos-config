{
  flake.modules.homeManager.cli-tools = {
    programs.zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
  };
}
