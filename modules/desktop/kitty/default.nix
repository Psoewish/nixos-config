{ username, ... }:
{
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
    GTK_USE_PORTAL = 1;
  };
  home-manager.users.${username} = {
    programs.kitty = {
      enable = true;
      enableGitIntegration = true;

      settings = {
        font_family = "CaskaydiaCove Nerd Font";
        mouse_hide_wait = -1;
        url_style = "straight";
        show_hyperlink_targets = "yes";
        allow_remote_control = "yes";
        copy_on_select = "yes";
        strip_trailing_spaces = "smart";
        focus_follows_mouse = "yes";
        confirm_os_window_close = 0;
        enabled_layouts = "Grid, Fat:bias=80;full_size=1, Tall, Stack, Splits";
        window_border_width = 1;
        draw_minimal_borders = "yes";
        tab_bar_edge = "top";
        tab_bar_style = "powerline";
        tab_powerline_style = "angled";
        tab_title_template = "{index}: {title}";
        dynamic_background_opacity = "yes";
        background_opacity = 0.9;
      };

      quickAccessTerminalConfig = {
        lines = 35;
        columns = 125;
        edge = "center-sized";
        background_opacity = 0.9;
        output_name = "DP-1";
      };

      keybindings = {
        "ctrl+shift+left" = "previous_window";
        "ctrl+shift+right" = "next_window";
        "ctrl+alt+z" = "toggle_layout stack";
      };
    };
    xdg.configFile."kitty/sessions/dev.kitty-session".text = /* sh */ ''
      layout splits
      enabled_layouts splits,stack

      launch --title filetree broot
      launch --location=vsplit --bias=85 --title editor hx
      launch --location=vsplit --bias=25 --title claude claude
      focus_matching_window title:editor
      launch --location=hsplit --bias=20 --title terminal
    '';
  };
}
