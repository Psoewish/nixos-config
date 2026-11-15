{
  den.aspects.kitty = {
    homeManager = {
      programs.kitty = {
        enable = true;
        enableGitIntegration = true;
        settings = {
          window_margin_width = 5;
          collapse_window_margins = true;
          tab_bar_filter = "session:~";
          startup_session = "default";
          confirm_os_window_close = 0;
        };
        keybindings = {
          "alt+down" = "next_window";
          "alt+right" = "next_window";
          "alt+up" = "previous_window";
          "alt+left" = "previous_window";

          "ctrl+e" = "first_window";
          "ctrl+t" = "second_window";

          "alt+1" = "goto_tab 1";
          "alt+2" = "goto_tab 2";
          "alt+3" = "goto_tab 3";
          "alt+4" = "goto_tab 4";
          "alt+5" = "goto_tab 5";
        };
      };

      xdg.configFile = {
        "kitty/default".text = ''
          # Terminal
          new_tab home
          layout fat
          launch --title "home"

          # Editor + terminal
          new_tab nixos
          layout splits
          cd ~/nixos-config
          launch --title "editor" hx .
          launch --title "shell" --location=hsplit --bias=20

          # Git
          new_tab git
          cd ~/nixos-config
          launch --title "lazygit" lazygit --screen-mode half

          # SSH
          new_tab ssh
          cd ~/nixos-config
          launch --title "mononoke" kitten ssh mononoke
        '';
      };
    };
  };
}
