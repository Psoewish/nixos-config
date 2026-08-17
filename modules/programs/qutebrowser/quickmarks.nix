toplevel @ {config, ...}: {
  flake.modules.homeManager.qutebrowser = {lib, ...}: {
    programs.qutebrowser = {
      quickmarks =
        {
          youtube = "https://youtube.com";
          twitch = "https://twitch.tv";
          github = "https://github.com";
          mynixos = "https://mynixos.com";
          gw2efficiency = "https://gw2efficiency.com";
          gw2wiki = "https://wiki.guildwars2.com";
          steam = "https://steampowered.com";
        }
        // lib.genAttrs (builtins.attrNames toplevel.config.routes) (service: "https://${service}.${toplevel.config.global.domain}");
    };
  };
}
