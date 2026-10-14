toplevel @ {...}: {
  flake.modules.nixos.helix = {
    home-manager.sharedModules = [toplevel.inputs.self.modules.homeManager.helix];
  };

  flake.modules.homeManager.helix = {pkgs, ...}: {
    programs.helix = {
      enable = true;
      defaultEditor = true;
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
        typescript-language-server
        marksman
        markdown-oxide
        harper
        mpls
        prettier
      ];
      settings = {
        editor = {
          bufferline = "multiple";
          color-modes = true;
          continue-comments = false;
          end-of-line-diagnostics = "hint";
          line-number = "absolute";
          cursor-shape.insert = "bar";
          file-picker.hidden = false;
          indent-guides = {
            character = "▏";
            render = true;
            skip-levels = 1;
          };
          inline-diagnostics.cursor-line = "warning";
          soft-wrap.enable = true;
          statusline = {
            center = [
              "spinner"
              "file-name"
              "file-modification-indicator"
            ];
            left = [
              "mode"
              "read-only-indicator"
              "diagnostics"
            ];
            right = [
              "file-type"
              "position"
            ];
          };
          whitespace.render = {
            nbsp = "none";
            newline = "none";
            nnbsp = "none";
            space = "none";
            tab = "all";
          };
        };

        keys.normal = {
          C-g = [
            ":write-all"
            ":new"
            ":insert-output lazygit"
            ":set mouse false"
            ":set mouse true"
            ":buffer-close!"
            ":redraw"
            ":reload-all"
          ];
          C-s = [":w"];
          esc = [
            "collapse_selection"
            "keep_primary_selection"
          ];
        };
      };
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = ["nixd" "nil"];
          formatter.command = "alejandra";
        }
        {
          name = "lua";
          auto-format = true;
        }
        {
          name = "markdown";
          auto-format = true;
          language-servers = [
            "marksman"
            "markdown-oxide"
            "harper-ls"
            "mpls"
          ];
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "--markdown"
              "--prose-wrap"
              "never"
            ];
          };
        }
        {
          name = "ini";
          file-types = ["ini" "conf"];
        }
      ];
    };
  };
}
