{
  flake.modules.nixos.prowlarr = {config, ...}: {
    virtualisation.oci-containers.containers.prowlarr = {
      hostname = "prowlarr";
      image = "lscr.io/linuxserver/prowlarr:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/prowlarr:/config"
      ];
      extraOptions = ["--network=host"];
    };
  };

  flake.routes.prowlarr = {
    port = 9696;
  };
}
