{
  den.aspects.services.backend.nzbhydra = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates.nzbhydra.content = lib.concatLines [
        "PUID=1000"
        "PGID=1000"
        "TZ=${config.time.timeZone}"
      ];

      virtualisation.oci-containers.containers.nzbhydra = {
        image = "lscr.io/linuxserver/nzbhydra2:latest";
        environmentFiles = [config.security.nix-secrets.templates.nzbhydra.path];
        volumes = [
          "/var/lib/nzbhydra2:/config"
          "/data/downloads:/data/downloads"
        ];
      };
    };
  };
}
