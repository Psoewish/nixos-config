{ username, pkgs, ... }:
{
  home-manager.users.${username} = {
    programs.zed-editor = {
      enable = true;
      package = pkgs.unstable.zed-editor;
      userSettings = {
        lsp_document_colors = "background";
        disable_ai = false;
        telemetry = {
          metrics = false;
        };
        terminal = {
          shell.program = "fish";
        };
        helix_mode = true;
        languages = {
          Nix = {
            language_servers = [
              "nixd"
              "!nil"
            ];
            formatter.external.command = "nixfmt";
          };
        };
      };
      userKeymaps = [
        {
          bindings = {
            ctrl-t = "terminal_panel::Toggle";
            ctrl-shift-t = "workspace::NewTerminal";
          };
        }
      ];
      extensions = [
        "nix"
        "html"
        "pylsp"
        "basher"
        "hyprlang"
        "fish"
        "xml"
        "toml"
        "scss"
        "lua"
        "csharp"
        "dockerfile"
        "docker-compose"
        "rainbow-csv"
        "zig"
        "ini"
        "nu"
        "qml"
        "jq"
        "desktop"
        "json5"
        "color-highlight"
      ];
    };
  };
}
