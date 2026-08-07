{
  flake.modules.nixos.profilarr = {config, ...}: {
    virtualisation.oci-containers.containers.profilarr = {
      name = "profilarr";
      container = {
        image = "santiagosayshey/profilarr:latest";
        pull = "always";
        environment = {
          PUID = "${config.hosts.homelab.users.media.id}";
          PGID = "${config.hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/profilarr:/config"
        ];
        extraOptions = ["--network=host"];
      };
    };

    services.caddy.virtualHosts = {
      "profilarr.${config.global.domain}" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:6868
        '';
      };
    };
  };
}
