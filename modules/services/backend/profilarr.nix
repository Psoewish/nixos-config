toplevel@{config,...}:{
  flake.modules.nixos.profilarr = {config, ...}: {
    virtualisation.oci-containers.containers.profilarr = {
      hostname = "profilarr";
      image = "ghcr.io/dictionarry-hub/profilarr:latest";
      pull = "always";
      environment = {
        PUID = toString toplevel.config.hosts.nixos.homelab.users.media.id;
        PGID = toString toplevel.config.hosts.nixos.homelab.users.media.id;
        ORIGIN = "https://${toplevel.config.routing.services.profilarr.service}.${toplevel.config.routing.domain}";
        AUTH = "off";
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/profilarr:/config"
      ];
      extraOptions = ["--network=host"];
    };
  };

  routing.services.profilarr = {
    port = 6868;
  };
}
