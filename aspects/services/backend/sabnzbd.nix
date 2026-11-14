{
  den.aspects.services.backend.sabnzbd = {
    nixos = {config, ...}: {
      services.sabnzbd = {
        enable = true;
        group = "media";
        allowConfigWrite = true;
        secretFiles = [config.sops.secrets."sabnzbd".path];
        settings = {
          misc = {
            download_dir = "/data/downloads/usenet/incomplete";
            complete_dir = "/data/downloads/usenet/complete";
            host_whitelist = ["localhost" "sabnzbd.psoewish.com"];
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
      services.traefik.dynamicConfigOptions.http = {
        routers.sabnzbd = {
          service = "sabnzbd";
          rule = "Host(`sabnzbd.psoewish.com`)";
          entryPoints = ["websecure"];
        };
        services.sabnzbd.loadBalancer.servers = ["http://localhost:8080"];
      };
    };
  };
}
