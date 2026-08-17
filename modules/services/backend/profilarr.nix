toplevel@{config,...}:{
  flake.modules.nixos.profilarr = {config, ...}: {
    virtualisation.oci-containers.containers.profilarr = {
      hostname = "profilarr";
      image = "ghcr.io/dictionarry-hub/profilarr:latest";
      pull = "always";
      environment = {
        PUID = toString toplevel.config.hosts.nixos.homelab.users.media.id;
        PGID = toString toplevel.config.hosts.nixos.homelab.users.media.id;
        ORIGIN = "https://${toplevel.config.routes.profilarr.service}.${toplevel.config.global.domain}";
        AUTH = "off";
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/profilarr:/config"
      ];
      extraOptions = ["--network=host"];
    };
  };

  routes.profilarr = {
    port = 6868;
  };
}
