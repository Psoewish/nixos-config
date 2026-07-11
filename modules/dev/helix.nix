{ pkgs, lib, ... }:
let
  inherit (pkgs)
    helix
    lazygit
    nixd
    nixfmt
    marksman
    markdown-oxide
    harper
    mpls
    prettier
    ;
  inherit (pkgs.writers) writeTOML;
  inherit (lib) getExe;
in
{
  environment.systemPackages = [ helix ];

  hjem.fractal.config.files = {
    "helix/config.toml" = {
      generator = writeTOML "config.toml";
      value = {
        theme = "rose_pine";
        editor = {
          line-number = "absolute";
          continue-comments = false;
          bufferline = "multiple";
          color-modes = true;
          end-of-line-diagnostics = "hint";
        };
        editor.statusline = {
          left = [
            "mode"
            "read-only-indicator"
            "diagnostics"
          ];
          center = [
            "spinner"
            "file-name"
            "file-modification-indicator"
          ];
          right = [
            "file-type"
            "position"
          ];
        };
        editor.cursor-shape = {
          insert = "bar";
        };
        editor.file-picker = {
          hidden = false;
        };
        editor.whitespace.render = {
          space = "none";
          tab = "all";
          nbsp = "none";
          nnbsp = "none";
          newline = "none";
        };
        editor.indent-guides = {
          render = true;
          character = "▏";
          skip-levels = 1;
        };
        editor.soft-wrap = {
          enable = true;
        };
        editor.inline-diagnostics = {
          cursor-line = "warning";
        };
        keys = {
          normal = {
            esc = [
              "collapse_selection"
              "keep_primary_selection"
            ];
            C-g = [
              ":new"
              ":insert-output ${getExe lazygit}"
              ":buffer-close!"
              ":redraw"
            ];
            C-s = [ ":w" ];
          };
        };
      };
    };

    "helix/languages.toml" = {
      generator = writeTOML "languages.toml";
      value = {
        language = [
          {
            name = "nix";
            language-servers = [
              "${getExe nixd}"
            ];
            auto-format = true;
            formatter = {
              command = "${getExe nixfmt}";
            };
          }
          {
            name = "lua";
            auto-format = true;
          }
          {
            name = "markdown";
            language-servers = [
              "${getExe marksman}"
              "${getExe markdown-oxide}"
              "${getExe harper}"
              "${getExe mpls}"
            ];
            formatter = {
              command = "${getExe prettier}";
              args = [
                "--parser"
                "--markdown"
                "--prose-wrap"
                "never"
              ];
            };
            auto-format = true;
          }
        ];
        language-server.harper-ls = {
          command = "${getExe harper}";
          args = [ "--stdio" ];
        };
        language-server.mpls = {
          command = "${getExe mpls}";
          args = [
            "--dark-mode"
            "--enable-emoji"
            "--full-sync"
          ];
        };
      };
    };
  };
}
