{ username, ... }:
{
  home-manager.users.${username} = {
    catppuccin.wezterm.enable = false;
    programs.wezterm = {
      enable = true;
      extraConfig = /* lua */ ''
        local wezterm = require 'wezterm'
        local config = wezterm.config_builder()

        config = {
          color_scheme = "Catppuccin Mocha",
          use_fancy_tab_bar = false,
          hide_tab_bar_if_only_one_tab = true,
          window_padding = {
            left = 0,
            right = 0,
            top = 0,
            bottom = 0,
          },
        }

        return config
      '';
    };
  };
}
