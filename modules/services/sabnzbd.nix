{
  flake.modules.nixos.sabnzbd = {config, ...}: {
    virtualisation.oci-containers.containers.sabnzbd = {
      name = "sabnzbd";
      container = {
        image = "lscr.io/linuxserver/sabnzbd:latest";
        pull = "always";
        environment = {
          PUID = "${config.hosts.homelab.users.media.id}";
          PGID = "${config.hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/sabnzbd:/config"
          "/data/downloads/usenet:/downloads/usenet"
        ];
        extraOptions = ["--network=host"];
      };
    };

    services.caddy.virtualHosts = {
      "nzbhydra.${config.global.domain}" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:8080
        '';
      };
    };
  };
}
