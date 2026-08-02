{
  flake.modules.homeManager.cli-tools = { pkgs, ... }: {
    programs.zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };
  };
}
