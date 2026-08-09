{
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
          host_whitelist = ["localhost" "${config.routes.sabnzbd.service}.${config.global.domain}"];
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
      # configFile = "/var/lib/sabnzbd/sabnzbd.ini"; # Add full settings later
    };
  };

  flake.routes.sabnzbd = {
    port = 8080;
  };
}
