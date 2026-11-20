{
  den.aspects.services.backend.profilarr = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates.profilarr.content = lib.concatLines [
        "PUID=1000"
        "PGID=1000"
        "TZ=${config.time.timeZone}"
        "ORIGIN=https://profilarr.psoewish.com"
        "AUTH=off"
      ];

      virtualisation.oci-containers.containers.profilarr = {
        image = "ghcr.io/dictionarry-hub/profilarr:latest";
        environmentFiles = [config.security.nix-secrets.templates.profilarr.path];
        volumes = ["/var/lib/profilarr:/config"];
        ports = ["6868:6868"];
        labels = {
          "tsdproxy.enable" = "true";
          "tsdproxy.domain" = "profilarr.psoewish.com";
        };
      };
    };
  };
}
