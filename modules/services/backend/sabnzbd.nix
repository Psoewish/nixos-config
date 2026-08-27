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
          host_whitelist = ["localhost" "${toplevel.config.flake.routes.sabnzbd.service}.${toplevel.config.flake.metadata.domain}"];
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

  flake.routes.sabnzbd = {
    port = 8080;
  };
}
