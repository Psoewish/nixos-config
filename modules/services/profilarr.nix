{
  flake.modules.nixos.profilarr = {
    config,
    hosts,
    ...
  }: {
    virtualisation.oci-containers.containers.profilarr = {
      name = "profilarr";
      container = {
        image = "santiagosayshey/profilarr:latest";
        pull = "always";
        environment = {
          PUID = "${hosts.homelab.users.media.id}";
          PGID = "${hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/profilarr:/config"
        ];
        extraOptions = ["--network=host"];
      };
    };

    services.caddy.virtualHosts = {
      "profilarr.psoewish.com" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:6868
        '';
      };
    };
  };
}
