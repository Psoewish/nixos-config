{
  den.aspects.services.backend.wud = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates.wud.content = lib.concatLines [
        "WUD_AUTH_ADMIN_USER=psoewish"
        "WUD_AUTH_ADMIN_PASSWORD=${config.security.nix-secrets.secrets."wud/password"}"
        "WUD_TRIGGER_DOCKERCOMPOSE_LOCAL_AUTO=false"
        "WUD_TRIGGER_DOCKERCOMPOSE_LOCAL_PRELOAD=true"
        "WUD_TRIGGER_DOCKERCOMPOSE_LOCAL_PRUNE=true"
      ];

      virtualisation.oci-containers.containers.wud = {
        image = "ghcr.io/getwud/wud";
        environmentFiles = [config.security.nix-secrets.templates.wud.path];
        volumes = [
          "/var/run/docker.sock:/var/run/docker.sock"
          "/var/lib/wud:/store"
        ];
        labels = {
          "traefik.enable" = "true";
          "traefik.http.routers.wud.rule" = "Host(`wud.psoewish.com`)";
        };
      };
    };
  };
}
