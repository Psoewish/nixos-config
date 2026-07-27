{ ... }: {
  flake.modules.homeManager.qutebrowser = {
    programs.qutebrowser = {
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
    };
  };
}
