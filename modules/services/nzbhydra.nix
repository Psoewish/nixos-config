{
  flake.modules.nixos.nzbhydra = {config, ...}: {
    virtualisation.oci-containers.containers.nzbhydra = {
      name = "nzbhydra";
      container = {
        image = "lscr.io/linuxserver/nzbhydra2:latest";
        pull = "always";
        environment = {
          PUID = "${config.hosts.homelab.users.media.id}";
          PGID = "${config.hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/nzbhydra2:/config"
        ];
        extraOptions = ["--network=host"];
      };
    };

    services.caddy.virtualHosts = {
      "nzbhydra.${config.global.domain}" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:5076
        '';
      };
    };
  };
}
