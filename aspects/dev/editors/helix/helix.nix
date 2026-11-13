{
  den,
  inputs,
  ...
}: {
  den.aspects.dev.editors.helix = {
    includes = with den.aspects.dev; [languages._ editors.helix.plugins._];

    nixos = {pkgs, ...}: {
      nixpkgs.overlays = [inputs.helix-plugins.overlays.default];
      environment.systemPackages = with pkgs; [helix];
    };

    homeManager = {
      lib,
      helix-languages,
      ...
    }: {
      imports = [inputs.helix-plugins.homeManagerModules.default];
      programs.helix = {
        enable = true;
        languages = lib.mkMerge helix-languages;
        settings.editor = {
          default-yank-register = "+";
          bufferline = "multiple";
          color-modes = true;
          continue-comments = false;
          end-of-line-diagnostics = "hint";
          preview-completion-insert = false;
          line-number = "absolute";
          trim-trailing-whitespace = true;
          popup-border = "all";
          cursor-shape.insert = "bar";
          file-picker.hidden = false;
          jump-label-alphabet = "tnseriaodhplfuwyqvkcxz"; # Comfier colemak-dh order :)
          indent-guides = {
            character = "▏";
            render = true;
            skip-levels = 1;
          };
          lsp = {
            display-inlay-hints = true;
          };
          inline-diagnostics.cursor-line = "warning";
          soft-wrap.enable = true;
          smart-tab.supersede-menu = false;
          statusline = {
            left = [
              "mode"
              "spacer"
              "version-control"
              "diagnostics"
            ];
            center = [
              "spinner"
              "file-name"
              "file-modification-indicator"
              "read-only-indicator"
            ];
            right = [
              "position"
              "separator"
              "total-line-numbers"
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
        settings.keys.normal = {
          A-e = [":grove-focus!"];
          A-E = [":grove-visibility-toggle!"];
          C-b = [":who-toggle"];
          C-down = [":move_lines_down"];
          C-up = [":move_lines_up"];
          C-s = [":w"];
          esc = ["collapse_selection" "keep_primary_selection"];
          space = {
            e = [":grove-focus!"];
            E = [":grove-visibility-toggle!"];
          };
        };
      };
    };
  };
}
