{ username, ... }:
{
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
    GTK_USE_PORTAL = 1;
  };
  home-manager.users.${username} = {
    programs.kitty =
      let
        kitty_mod = "ctrl+shift";
        session_dir = "/home/${username}/.config/kitty/sessions";
      in
      {
        enable = true;
        enableGitIntegration = true;

        settings = {
          font_family = "CaskaydiaCove Nerd Font";
          url_style = "straight";
          window_border_width = 1;
          draw_minimal_borders = "yes";
          tab_bar_edge = "top";
          tab_bar_style = "powerline";
          tab_powerline_style = "angled";
          tab_title_template = "{session_name} {title}";
          tab_bar_filter = "session:~ or session:^$";
          startup_session = "${session_dir}/01.default.kitty-session";
          dynamic_background_opacity = "yes";
          background_opacity = 0.9;
          mouse_hide_wait = -1;
          show_hyperlink_targets = "yes";
          allow_remote_control = "yes";
          copy_on_select = "yes";
          strip_trailing_spaces = "smart";
          focus_follows_mouse = "yes";
          confirm_os_window_close = 0;
        };

        # Default dropdown terminal settings
        quickAccessTerminalConfig = {
          lines = 35;
          columns = 125;
          edge = "center-sized";
          background_opacity = 0.9;
          output_name = "DP-1";
        };

        # Keybinds
        keybindings = {
          "${kitty_mod}+enter" = "new_window_with_cwd";
          "${kitty_mod}+t" = "new_tab_with_cwd";
          "${kitty_mod}+left" = "previous_window";
          "${kitty_mod}+right" = "next_window";
          "${kitty_mod}+Tab" = "goto_session -1"; # Toggle between last two sessions

          "${kitty_mod}+Escape" = "goto_session --sort-by=alphabetical"; # Interactive session picker
          "${kitty_mod}+1" = "goto_session ${session_dir}/01.default.kitty-session";
          "${kitty_mod}+2" = "goto_session ${session_dir}/02.nixos-config.kitty-session";
          "${kitty_mod}+0" = "goto_session ${session_dir}/10.dev.kitty-session";
        };
      };

    # Sessions
    xdg.configFile = {
      # Default startup session (prevents random extra tab in my actual sessions)
      "kitty/sessions/01.default.kitty-session".text = /* sh */ ''
        layout tall
        launch
      '';

      # NixOS config session
      "kitty/sessions/02.nixos-config.kitty-session".text = /* sh */ ''
        # Local view
        layout splits
        cd ~/flakes/nixos-config

        launch --title editor hx
        launch --location=vsplit --bias=25 --title ai claude
        focus_matching_window title:editor
        launch --location=hsplit --bias=20 --title terminal

        # Homelab view (ssh)
        new_tab ssh
        layout tall:bias=70

        launch --title terminal sh -c "kitten ssh -t homelab"
        launch --title system-monitor sh -c "kitten ssh -t homelab -- top"
        launch --title services sh -c "kitten ssh -t homelab -- systemctl status jellyfin"

        # Make sure editor in local tab is focussed
        focus_tab title:local
        focus_matching_window title:editor
      '';

      # Ad-hoc dev session for arbitrary projects I haven't created a dedicated session for
      "kitty/sessions/10.dev.kitty-session".text = /* sh */ ''
        layout splits
        launch --title editor hx
        launch --location=vsplit --bias=25 --title ai claude
        focus_matching_window title:editor
        launch --location=hsplit --bias=20 --title terminal

        # Focus Helix
        focus_matching_window title:editor
      '';
    };
  };
}
