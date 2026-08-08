{
  flake.modules.nixos.sonarr = {config, ...}: {
    virtualisation.oci-containers.containers.sonarr = {
      hostname = "sonarr";
      image = "lscr.io/linuxserver/sonarr:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/sonarr:/config"
        "/data/media/tv:/tv"
        "/data/downloads/usenet:/downloads/usenet"
        "/data/downloads/torrents:/downloads/torrents"
      ];
      extraOptions = ["--network=host"];
    };
  };

  flake.routes.sonarr = {
    port = 8989;
  };
}
