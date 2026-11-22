{
  den.aspects.services.backend.prowlarr = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates.prowlarr.content = lib.concatLines [
        "PUID=1000"
        "PGID=1000"
        "TZ=${config.time.timeZone}"
        "PROWLARR__AUTH__METHOD=External"
        "PROWLARR__AUTH__APIKEY=${config.security.nix-secrets.secrets."prowlarr/api"}"
      ];

      virtualisation.oci-containers.containers.prowlarr = {
        image = "lscr.io/linuxserver/prowlarr:latest";
        environmentFiles = [config.security.nix-secrets.templates.prowlarr.path];
        volumes = [
          "/var/lib/prowlarr:/config"
          "/data/downloads:/data/downloads"
        ];
        labels = {
          "traefik.enable" = "true";
          "traefik.http.routers.prowlarr.rule" = "Host(`prowlarr.psoewish.com`)";
        };
      };
    };
  };
}
