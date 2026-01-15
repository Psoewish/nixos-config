{ username, pkgs, ... }:
{
  home-manager.users.${username} = {
    programs.claude-code = {
      enable = true;
      commands = {
        haiku = "/model haiku";
        sonnet = "/model sonnet";
      };
      mcpServers = {
        nixos = {
          command = "nix";
          args = [
            "run"
            "github:utensils/mcp-nixos"
            "--"
          ];
        };
      };
    };
  };
}
