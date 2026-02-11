{ ... }:
{
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = true; # For dynamic settings (allowing paste permissions to persist, for example)
    quickmarks = {
      jellyfin = "https://jellyfin.psoewish.com";
      jellyseerr = "https://jellyseerr.psoewish.com";
      sonarr = "https://sonarr.psoewish.com";
      radarr = "https://radarr.psoewish.com";
      prowlarr = "https://prowlarr.psoewish.com";
      profilarr = "https://profilarr.psoewish.com";
      unmanic = "https://unmanic.psoewish.com";
      nzbhydra = "https://nzbhydra.psoewish.com";
      nzbget = "https://nzbget.psoewish.com";
      qbittorrent = "https://qbittorrent.psoewish.com";
      vaultwarden = "https://vault.psoewish.com";

      youtube = "https://youtube.com";
      twitch = "https://twitch.tv";
      github = "https://github.com";
      mynixos = "https://mynixos.com";
      gw2efficiency = "https://gw2efficiency.com";
      gw2wiki = "https://wiki.guildwars2.com";
      steam = "https://steampowered.com";
    };

    searchEngines.default = "https://duckduckgo.com/?q={}";

    settings =
      let
        theme = {
          base = "#191724";
          surface = "#1f1d2e";
          overlay = "#26233a";
          muted = "#6e6a86";
          subtle = "#908caa";
          text = "#e0def4";
          love = "#eb6f92";
          gold = "#f6c177";
          rose = "#ebbcba";
          pine = "#31748f";
          foam = "#9ccfd8";
          iris = "#c4a7e7";
          highlightLow = "#21202e";
          highlightMed = "#403d52";
          highlightHigh = "#524f67";
        };
      in
      {
        auto_save.session = true;
        colors = {
          completion = {
            category = {
              fg = theme.love;
              bg = theme.base;
              border.top = theme.overlay;
              border.bottom = theme.surface;
            };
            fg = theme.text;
            even.bg = theme.highlightLow;
            odd.bg = theme.highlightMed;
            item.selected = {
              fg = theme.text;
              bg = theme.highlightMed;
              border.bottom = theme.surface;
              border.top = theme.surface;
              match.fg = theme.rose;
            };
            match.fg = theme.text;
            scrollbar.fg = theme.surface;
            scrollbar.bg = theme.overlay;
          };
          statusbar = {
            normal.fg = theme.rose;
            normal.bg = theme.base;
            insert.fg = theme.pine;
            insert.bg = theme.base;
            command.fg = theme.love;
            command.bg = theme.base;
            caret = {
              fg = theme.overlay;
              bg = theme.base;
              selection.fg = theme.iris;
              selection.bg = theme.base;
            };
            passthrough.fg = theme.subtle;
            passthrough.bg = theme.surface;
            private.fg = theme.highlightMed;
            private.bg = theme.love;
            progress.bg = theme.foam;
            url = {
              fg = theme.text;
              hover.fg = theme.gold;
              error.fg = theme.gold;
              success.http.fg = theme.subtle;
              success.https.fg = theme.subtle;
              warn.fg = theme.gold;
            };
          };
          tabs = {
            bar.bg = theme.base;
            even.fg = theme.subtle;
            even.bg = theme.base;
            odd.fg = theme.subtle;
            odd.bg = theme.base;
            selected = {
              even.fg = theme.text;
              even.bg = theme.highlightMed;
              odd.fg = theme.text;
              odd.bg = theme.highlightMed;
            };
            indicator.start = theme.pine;
            indicator.stop = theme.pine;
            indicator.error = theme.gold;
            pinned = {
              even.fg = theme.subtle;
              even.bg = theme.overlay;
              odd.fg = theme.subtle;
              odd.bg = theme.overlay;
              selected = {
                even.fg = theme.text;
                even.bg = theme.highlightMed;
                odd.fg = theme.text;
                odd.bg = theme.highlightMed;
              };
            };
          };
          contextmenu = {
            menu.fg = theme.text;
            menu.bg = theme.surface;
            disabled.fg = theme.text;
            disabled.bg = theme.muted;
            selected.fg = theme.base;
            selected.bg = theme.rose;
          };
          webpage = {
            bg = theme.base;
            darkmode = {
              enabled = true;
              policy.images = "never";
            };
            preferred_color_scheme = "dark";
          };
          keyhint.fg = theme.text;
          keyhint.bg = theme.surface;
          keyhint.suffix.fg = theme.rose;
          hints.fg = theme.text;
          hints.bg = theme.surface;
          hints.match.fg = theme.rose;
          downloads = {
            bar.bg = theme.base;
            error.fg = theme.gold;
            error.bg = theme.base;
            start.fg = theme.pine;
            start.bg = theme.base;
            stop.fg = theme.rose;
            stop.bg = theme.base;
            system.fg = "none";
            system.bg = "none";
          };
          prompts = {
            fg = theme.text;
            bg = theme.surface;
            border = theme.subtle;
            selected.fg = theme.text;
            selected.bg = theme.overlay;
          };
          messages = {
            error.fg = theme.text;
            error.bg = theme.surface;
            error.border = theme.surface;
            info.fg = theme.gold;
            info.bg = theme.surface;
            info.border = theme.surface;
            warning.fg = theme.gold;
            warning.bg = theme.surface;
            warning.border = theme.surface;
          };
        };
        fonts.default_family = "Maple Mono NF CN";
        fonts.default_size = "12pt";
        downloads = {
          position = "bottom";
          remove_finished = 300000;
        };
        scrolling = {
          bar = "never";
          smooth = true;
        };
        statusbar.show = "in-mode";
        hints.chars = "arstneio";
        hints.border = "1px solid ${theme.highlightHigh}";
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
}
