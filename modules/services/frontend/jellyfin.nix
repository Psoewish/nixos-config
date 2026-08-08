{
  flake.modules.nixos.jellyfin = {config, ...}: {
    virtualisation.oci-containers.containers.jellyfin = {
      hostname = "jellyfin";
      image = "jellyfin/jellyfin:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/jellyfin:/config"
        "/data/media/tv:/data/media/tv"
        "/data/media/movies:/data/media/movies"
      ];
      devices = ["/dev/dri:/dev/dri"];
      extraOptions = ["--network=host"];
    };
  };

  flake.routes.jellyfin = {
    port = 8096;
    public = true;
  };
}
