{ username, ... }:
{
  home-manager.users.${username}.programs.qutebrowser = {
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

    settings = {
      auto_save.session = true;
      colors.webpage = {
        darkmode = {
          enabled = true;
          policy.images = "never";
        };
        preferred_color_scheme = "dark";
      };
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
