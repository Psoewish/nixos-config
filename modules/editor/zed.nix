{
  programs.nix-ld.enable = true;
  home.config.programs.zed-editor = {
    enable = true;
    userSettings = {
      helix_mode = true;
      prettier.allowed = true;
      buffer_font_family = "Maple Mono NF CN";
      buffer_font_size = 14;
      cli_default_open_behavior = "existing_window";
      disable_ai = true;
      git_panel = {
        show_count_badge = true;
        commit_editor = "expanded";
        entry_primary_click_action = "file_diff";
        folder_indicator = "both";
        file_icons = false;
        tree_view = true;
        collapse_untracked_diff = false;
        group_by = "status";
        dock = "left";
      };
      git = {
        path_style = "file_name_first";
        hunk_style = "staged_hollow";
      };
      languages = {
        Nix = {
          format_on_save = "on";
          formatter.external = {
            command = "alejandra";
            arguments = [
              "--quiet"
              "--"
            ];
          };
          language_servers = ["nixd" "nil"];
        };
      };
      lsp_document_colors = "background";
      project_panel = {
        dock = "left";
        hide_root = true;
        auto_fold_dirs = true;
      };
      session.trust_all_worktrees = true;
      telemetry.metrics = false;
      terminal.shell.program = "fish";
      theme = "Noctalia Dark";
      ui_font_family = "Inter";
      ui_font_size = 14;
    };
    userKeymaps = [
      {
        bindings = {
          ctrl-shift-t = "workspace::NewTerminal";
          ctrl-t = "terminal_panel::Toggle";
        };
      }
    ];
  };
}
