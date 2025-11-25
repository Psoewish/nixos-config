{ username, ... }:
{
  home-manager.users.${username} = {
    programs.wezterm = {
      enable = true;
      extraConfig = /* lua */ ''
        local wezterm = require 'wezterm'
        local config = wezterm.config_builder()

        config.enable_tab_bar = false
        config.window_decorations = "resize"

        return config
      '';
    };
  };
}
