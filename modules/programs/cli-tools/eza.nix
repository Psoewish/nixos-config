{
  flake.modules.homeManager.cli-tools = {
    programs.eza = {
      enable = true;
      colors = "always";
      icons = "always";
      git = true;
      extraOptions = [
        "--all"
        "--group-directories-first"
      ];
    };
  };
}
