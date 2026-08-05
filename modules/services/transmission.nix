{
  flake.modules.nixos.transmission = {
    config,
    hosts,
    ...
  }: {
    virtualisation.oci-containers.containers.transmission = {
      name = "transmission";
      container = {
        image = "lscr.io/linuxserver/transmission:latest";
        pull = "always";
        environment = {
          PUID = "${hosts.homelab.users.media.id}";
          PGID = "${hosts.homelab.users.media.id}";
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
      "transmission.psoewish.com" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:9091
        '';
      };
    };
  };
}
