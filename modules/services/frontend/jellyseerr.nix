{
  flake.modules.nixos.jellyseerr = {config, ...}: {
    virtualisation.oci-containers.containers.jellyseerr = {
      hostname = "jellyseerr";
      image = "ghcr.io/seerr-team/seerr:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/jellyseerr:/app/config"
      ];
      extraOptions = ["--network=host" "--init"];
    };
  };

  flake.routes.jellyseerr = {
    aliases = ["seerr"];
    port = 5055;
    public = true;
  };
}
