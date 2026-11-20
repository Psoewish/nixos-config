{
  den.aspects.services.backend.nzbget = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates.nzbget.content = lib.concatLines [
        "PUID=1000"
        "PGID=1000"
        "TZ=${config.time.timeZone}"
        "NZBGET_USER=psoewish"
        "NZBGET_PASS=${config.security.nix-secrets.secrets."nzbget/password"}"
      ];

      virtualisation.oci-containers.containers.nzbget = {
        image = "lscr.io/linuxserver/nzbget:latest";
        environmentFiles = [config.security.nix-secrets.templates.nzbget.path];
        volumes = [
          "/var/lib/nzbget:/config"
          "/data/downloads/usenet:/data/downloads/usenet"
        ];
        ports = ["6789:6789"];
        labels = {
          "tsdproxy.enable" = "true";
          "tsdproxy.domain" = "nzbget.psoewish.com";
        };
      };
    };
  };
}
