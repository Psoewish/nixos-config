{
  flake.modules.nixos.transmission = {config, ...}: {
    virtualisation.oci-containers.containers.transmission = {
      hostname = "transmission";
      image = "lscr.io/linuxserver/transmission:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/transmission:/config"
        "/data/downloads/torrents:/downloads/torrents"
      ];
      extraOptions = ["--network=host"];
    };
  };

  flake.routes.transmission = {
    port = 9091;
  };
}
