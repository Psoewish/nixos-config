{ ... }: {
  flake.modules.homeManager.helix = {
    programs.helix.settings = {
      theme = "catppuccin_mocha";
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
        C-s = [ ":w" ];
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
      };
    };
  };
}
