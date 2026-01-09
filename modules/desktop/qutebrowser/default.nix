{ username, ... }:
{
  home-manager.users.${username}.programs.qutebrowser = {
    enable = true;
    quickmarks = {
      # homelab stuff
      jellyfin = "https://jellyfin.psoewish.com";
      jellyseerr = "https://jellyseerr.psoewish.com";
      sonarr = "https://sonarr.psoewish.com";
      radarr = "https://radarr.psoewish.com";
      unmanic = "https://unmanic.psoewish.com";
      nzbhydra = "https://nzbhydra.psoewish.com";
      sabnzbd = "https://sabnzbd.psoewish.com";
      vaultwarden = "https://vault.psoewish.com";

      youtube = "https://youtube.com";
      twitch = "https://twitch.tv";
      github = "https://github.com";
      mynixos = "https://mynixos.com";
      noogle = "https://noogle.dev";
      gw2efficiency = "https://gw2efficiency.com";
      gw2wiki = "https://wiki.guildwars2.com";
      steam = "https://steampowered.com";
      humblebundle = "https://humblebundle.com";
    };

    searchEngines = {
      default = "https://duckduckgo.com/?q={}";
      yt = "https://youtube.com/results?search_query={}";
      g = "https://google.com/search?q={}";
      n = "https://noogle.dev/q?term={}";
      nw = "https://wiki.nixos.org/index.php?search={}";
    };

    settings = {
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
      auto_save.session = true;
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
        padding = {
          top = 8;
          bottom = 8;
          right = 8;
          left = 8;
        };
      };
      content = {
        cookies.accept = "all";
        autoplay = false;
      };
    };
    keyBindings = {
      normal = {
        "alt-ctrl-c" = "config-cycle tabs.show always never";
        "alt-ctrl-left" = "set tabs.position left";
        "alt-ctrl-down" = "set tabs.position bottom";
        "alt-ctrl-up" = "set tabs.position top";
        "alt-ctrl-right" = "set tabs.position right";
      };
    };
  };
}
