{
  flake.modules.nixos.prowlarr = {
    config,
    hosts,
    ...
  }: {
    virtualisation.oci-containers.containers.prowlarr = {
      name = "prowlarr";
      container = {
        image = "lscr.io/linuxserver/prowlarr:latest";
        pull = "always";
        environment = {
          PUID = "${hosts.homelab.users.media.id}";
          PGID = "${hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/prowlarr:/config"
        ];
        extraOptions = ["--network=host"];
      };
    };

    services.caddy.virtualHosts = {
      "prowlarr.psoewish.com" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:9696
        '';
      };
    };
  };
}
