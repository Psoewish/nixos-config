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
          "alt+left" = "neighboring_window left";
          "alt+down" = "neighboring_window down";
          "alt+up" = "neighboring_window up";
          "alt+right" = "neighboring_window right";

          "ctrl+e" = "first_window";
          "ctrl+t" = "second_window";

          "alt+1" = "goto_tab 1";
          "alt+2" = "goto_tab 2";
          "alt+3" = "goto_tab 3";
          "alt+4" = "goto_tab 4";
          "alt+5" = "goto_tab 5";

          "ctrl+alt+1" = "goto_session default";
          "ctrl+alt+2" = "goto_session nixos";
        };
      };

      xdg.configFile = {
        "kitty/default".text = ''
          new_tab default
        '';
        "kitty/nixos".text = ''
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
