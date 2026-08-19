toplevel @ {config, ...}: {
  flake.modules.nixos.sabnzbd = {config, ...}: {
    services.sabnzbd = {
      enable = true;
      group = "media";
      allowConfigWrite = true;
      secretFiles = [config.age.secrets.sabnzbd_secrets.path];
      settings = {
        misc = {
          download_dir = "/data/downloads/usenet/incomplete";
          complete_dir = "/data/downloads/usenet/complete";
          host_whitelist = ["localhost" "${toplevel.config.routing.services.sabnzbd.service}.${toplevel.config.routing.domain}"];
        };
        categories = {
          movies.name = "movies";
          tv.name = "tv";
          software.name = "software";
          music.name = "music";
          books.name = "books";
          manual.name = "manual";
        };
      };
    };
  };

  routing.services.sabnzbd = {
    port = 8080;
  };
}
