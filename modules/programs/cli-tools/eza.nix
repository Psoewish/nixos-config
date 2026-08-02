{
  flake.modules.homeManager.cli-tools = { pkgs, ... }: {
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
