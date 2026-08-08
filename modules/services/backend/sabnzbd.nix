{
  flake.modules.nixos.sabnzbd = {config, ...}: {
    virtualisation.oci-containers.containers.sabnzbd = {
      hostname = "sabnzbd";
      image = "lscr.io/linuxserver/sabnzbd:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/sabnzbd:/config"
        "/data/downloads/usenet:/downloads/usenet"
      ];
      extraOptions = ["--network=host"];
    };
  };

  flake.routes.sabnzbd = {
    port = 8080;
  };
}
