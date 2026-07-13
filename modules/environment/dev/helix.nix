{ pkgs, lib, ... }:
let
  inherit (lib) getExe;
in
{
  environment.systemPackages = [ pkgs.helix ];

  hm.programs.helix = {
    enable = true;
    settings = {
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
            ":insert-output ${getExe pkgs.lazygit}"
            ":buffer-close!"
            ":redraw"
          ];
          C-s = [ ":w" ];
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          language-servers = [
            "${getExe pkgs.nixd}"
          ];
          auto-format = true;
          formatter = {
            command = "${getExe pkgs.nixfmt}";
          };
        }
        {
          name = "lua";
          auto-format = true;
        }
        {
          name = "markdown";
          language-servers = [
            "${getExe pkgs.marksman}"
            "${getExe pkgs.markdown-oxide}"
            "${getExe pkgs.harper}"
            "${getExe pkgs.mpls}"
          ];
          formatter = {
            command = "${getExe pkgs.prettier}";
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
        command = "${getExe pkgs.harper}";
        args = [ "--stdio" ];
      };
      language-server.mpls = {
        command = "${getExe pkgs.mpls}";
        args = [
          "--dark-mode"
          "--enable-emoji"
          "--full-sync"
        ];
      };
    };
  };
}
