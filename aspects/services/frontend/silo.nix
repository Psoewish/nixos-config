{
  den.aspects.services.frontend.silo = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates.silo.content = lib.concatLines [
        "PUID=1000"
        "PGID=1000"
        "TZ=${config.time.timeZone}"
        "SILO_TRANSCODE_ENABLED=true"
        "SILO_HW_ACCEL=vaapi"
        "SILO_HW_DEVICE=/dev/dri/renderD128"
        "SECRET_KEY=${config.security.nix-secrets.secrets."silo/secret_key"}"
        "ENABLE_REDIS=true"
        "ENABLE_MEILISEARCH=true"
        "PORT=8080"
        "JF_PORT=8096"
        "ABS_PORT=13378"
      ];

      virtualisation.oci-containers.containers.silo = {
        image = "ghcr.io/silo-server/silo-server:latest";
        environmentFiles = [config.security.nix-secrets.templates.silo.path];
        volumes = [
          "/var/lib/silo/config:/config"
          "/var/lib/silo/transcode:/tmp/silo-transcode"
          "/var/lib/silo/download-artifacts:/tmp/silo-download-artifacts"
          "/var/lib/silo/catalog-seeds:/catalog-seeds:ro"
          "/var/lib/silo/artwork:/var/lib/silo/artwork"
          "/data/media:/mnt/media:ro"
        ];
        devices = ["/dev/dri:/dev/dri"];
        ports = ["8888:8080"];
        labels = {
          "tsdproxy.enable" = "true";
          "tsdproxy.domain" = "silo.psoewish.com";
        };
      };
    };
  };
}
