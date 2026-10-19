toplevel @ {...}: {
  flake.modules.nixos.zed = {
    home-manager.sharedModules = [toplevel.inputs.self.modules.homeManager.zed];
    programs.nix-ld.enable = true;
  };

  flake.modules.homeManager.zed = {pkgs, ...}: {
    programs.zed-editor = {
      enable = true;
      userSettings = {
        lsp_document_colors = "background";
        disable_ai = true;
        telemetry.metrics = false;
        terminal.shell.program = "fish";
        helix_mode = true;
        session.trust_all_worktrees = true;
        project_panel = {
          dock = "left";
          hide_root = true;
        };
        git_panel.dock = "left";
        languages = {
          Nix = {
            language_servers = ["nixd" "nil"];
            formatter.external = {
              command = "alejandra";
              arguments = ["--quiet" "--"];
            };
            format_on_save = "on";
          };
          Lua = {
            format_on_save = "on";
            formatter = "language_server";
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
      extraPackages = with pkgs; [
        nixd
        nil
        alejandra
        fish-lsp
        bash-language-server
        vscode-langservers-extracted
        csharp-ls
        ruff
        rust-analyzer
        lldb
        tombi
        yaml-language-server
        lua-language-server
        marksman
        markdown-oxide
        harper
        mpls
        prettier
      ];
    };
  };
}
