{ username, ... }:
{
  home-manager.users.${username} = {
    programs.claude-code = {
      enable = true;
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
