{
  flake.modules.nixos.nzbhydra = {config, ...}: {
    virtualisation.oci-containers.containers.nzbhydra = {
      hostname = "nzbhydra";
      image = "lscr.io/linuxserver/nzbhydra2:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/nzbhydra2:/config"
      ];
      extraOptions = ["--network=host"];
    };
  };

  flake.routes.nzbhydra2 = {
    aliases = ["nzbhydra"];
    port = 5076;
  };
}
