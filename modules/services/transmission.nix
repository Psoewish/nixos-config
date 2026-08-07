{
  flake.modules.nixos.transmission = {config, ...}: {
    virtualisation.oci-containers.containers.transmission = {
      name = "transmission";
      container = {
        image = "lscr.io/linuxserver/transmission:latest";
        pull = "always";
        environment = {
          PUID = "${config.hosts.homelab.users.media.id}";
          PGID = "${config.hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/transmission:/config"
          "/data/downloads/torrents:/downloads/torrents"
        ];
        extraOptions = ["--network=host"];
      };
    };

    services.caddy.virtualHosts = {
      "transmission.${config.global.domain}" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:9091
        '';
      };
    };
  };
}
