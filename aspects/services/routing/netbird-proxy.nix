{
  den.aspects.services.routing.netbird-proxy = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates.netbird-proxy.content = lib.concatLines [
        "NB_PROXY_MANAGEMENT_ADDRESS=https://api.netbird.io"
        "NB_PROXY_TOKEN=${config.security.nix-secrets.secrets."netbird/proxy_token"}"
        "NB_PROXY_DOMAIN=psoewish.com"
        "NB_PROXY_PRIVATE=true"
        "NB_PROXY_ADDRESS=127.0.0.1:8443"
        "NB_PROXY_ACME_CERTIFICATES=false"
        "NB_PROXY_CERTIFICATE_DIRECTORY=/certs"
        "NB_PROXY_LOG_LEVEL=info"
      ];

      virtualisation.oci-containers.containers.netbird-proxy = {
        image = "docker.io/netbirdio/reverse-proxy:latest";
        environmentFiles = [config.security.nix-secrets.templates.netbird-proxy.path];
        volumes = ["/var/lib/certbot/certs:/certs"];
        dependsOn = ["certbot"];
      };
    };
  };
}
