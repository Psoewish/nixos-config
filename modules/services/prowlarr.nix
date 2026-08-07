{
  flake.modules.nixos.prowlarr = {config, ...}: {
    virtualisation.oci-containers.containers.prowlarr = {
      name = "prowlarr";
      container = {
        image = "lscr.io/linuxserver/prowlarr:latest";
        pull = "always";
        environment = {
          PUID = "${config.hosts.homelab.users.media.id}";
          PGID = "${config.hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/prowlarr:/config"
        ];
        extraOptions = ["--network=host"];
      };
    };

    services.caddy.virtualHosts = {
      "prowlarr.${config.global.domain}" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:9696
        '';
      };
    };
  };
}
