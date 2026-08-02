{
  flake.modules.homeManager.qutebrowser = {
    programs.qutebrowser = {
      loadAutoconfig = true; # For dynamic settings (allowing paste permissions to persist, for example)

      searchEngines.default = "https://duckduckgo.com/?q={}";

      settings = {
        auto_save.session = true;
        colors.webpage = {
          darkmode = {
            enabled = true;
            policy.images = "never";
          };
          preferred_color_scheme = "dark";
        };
        fonts.default_family = "Maple Mono NF CN";
        fonts.default_size = "12pt";
        downloads = {
          position = "bottom";
          remove_finished = 3000;
        };
        scrolling = {
          bar = "never";
          smooth = true;
        };
        statusbar.show = "in-mode";
        hints.chars = "arstneio";
        tabs = {
          last_close = "startpage";
          max_width = 250;
          show = "multiple";
        };
        content = {
          autoplay = false;
        };
      };

      extraConfig = ''
        c.tabs.padding = {'top': 8, 'bottom': 8, 'left': 8, 'right': 8}
      '';

      keyBindings = {
        normal = {
          "<Ctrl-Shift-C>" = "config-cycle tabs.show multiple never";
          "<Ctrl-Shift-Left>" = "set tabs.position left";
          "<Ctrl-Shift-Down>" = "set tabs.position bottom";
          "<Ctrl-Shift-Up>" = "set tabs.position top";
          "<Ctrl-Shift-Right>" = "set tabs.position right";
        };
      };
    };
  };
}
