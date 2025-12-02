{ username, ... }:
{
  home-manager.users.${username} = {
    programs.helix = {
      enable = true;
      defaultEditor = true;
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
      };
    };
  };
}
