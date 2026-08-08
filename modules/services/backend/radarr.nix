{
  flake.modules.nixos.radarr = {config, ...}: {
    virtualisation.oci-containers.containers.radarr = {
      hostname = "radarr";
      image = "lscr.io/linuxserver/radarr:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/radarr:/config"
        "/data/media/movies:/movies"
        "/data/downloads/usenet:/downloads/usenet"
        "/data/downloads/torrents:/downloads/torrents"
      ];
      extraOptions = ["--network=host"];
    };
  };

  flake.routes.radarr = {
    port = 7878;
  };
}
