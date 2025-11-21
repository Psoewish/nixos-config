{ username, ... }:
{
  home-manager.users.${username} = {
    programs.broot = {
      enable = true;
      settings = {
        default_flags = "-gh";
        show_selection_mark = true;
        # cols_order = [
        #   "mark"
        #   "git"
        #   "name"
        # ];
        auto_open_staging_area = false;
        icons_in_terminal = true;
        icon_theme = "nerdfont";
        show_hidden_files = true;

        verbs = [
          {
            name = "edit";
            invocation = "e";
            execution = "hx {file}";
            leave_broot = true;
          }
          {
            name = "create";
            invocation = "create {subpath}";
            execution = "touch {other-panel-file}/{subpath}";
            leave_broot = false;
          }
        ];
      };
    };
  };
}
