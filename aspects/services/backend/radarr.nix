{
  den.aspects.services.backend.radarr = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates.radarr.content = lib.concatLines [
        "PUID=1000"
        "PGID=1000"
        "TZ=${config.time.timeZone}"
        "RADARR__AUTH__METHOD=External"
        "RADARR__AUTH__APIKEY=${config.security.nix-secrets.secrets."radarr/api"}"
      ];

      virtualisation.oci-containers.containers.radarr = {
        image = "lscr.io/linuxserver/radarr:latest";
        environmentFiles = [config.security.nix-secrets.templates.radarr.path];
        volumes = [
          "/var/lib/radarr:/config"
          "/data/media:/data/media"
          "/data/downloads:/data/downloads"
        ];
        labels = {
          "docktail.service.enable" = "true";
          "docktail.service.name" = "radarr";
          "docktail.service.port" = "7878";
        };
      };
    };
  };
}
