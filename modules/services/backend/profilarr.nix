{
  flake.modules.nixos.profilarr = {config, ...}: {
    virtualisation.oci-containers.containers.profilarr = {
      hostname = "profilarr";
      image = "ghcr.io/dictionarry-hub/profilarr:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        ORIGIN = "https://${config.routes.profilarr.service}.${config.global.domain}";
        AUTH = "off";
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/profilarr:/config"
      ];
      extraOptions = ["--network=host"];
    };
  };

  flake.routes.profilarr = {
    port = 6868;
  };
}
