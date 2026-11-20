{
  den.aspects.services.backend.sonarr = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates.sonarr.content = lib.concatLines [
        "PUID=1000"
        "PGID=1000"
        "TZ=${config.time.timeZone}"
        "SONARR__AUTH__METHOD=External"
        "SONARR__AUTH__APIKEY=${config.security.nix-secrets.secrets."sonarr/api"}"
      ];

      virtualisation.oci-containers.containers.sonarr = {
        image = "lscr.io/linuxserver/sonarr:latest";
        environmentFiles = [config.security.nix-secrets.templates.sonarr.path];
        volumes = [
          "/var/lib/sonarr:/config"
          "/data/media:/data/media"
          "/data/downloads:/data/downloads"
        ];
        ports = ["8989:8989"];
        labels = {
          "tsdproxy.enable" = "true";
          "tsdproxy.domain" = "sonarr.psoewish.com";
        };
      };
    };
  };
}
