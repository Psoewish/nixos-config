{
  flake.modules.nixos.cli-tools = {
    programs.vivid = {
      enable = true;
      theme = "ansi";
    };
  };
}
