{ config, ... }:
{
  fractal.tags = [ "homelab" ];
  disabledModules = [ "services/security/crowdsec.nix" ];
  imports = [ ./override.nix ];

  services.crowdsec = {
    enable = true;
    autoUpdateService = true;

    hub = {
      collections = [
        "crowdsecurity/linux"
        "crowdsecurity/traefik"
        "crowdsecurity/http-cve"
        "crowdsecurity/whitelist-good-actors"
      ];
    };
    settings = {
      acquisitions = [
        {
          filenames = [ "/var/log/auth.log" ];
          labels.type = "syslog";
        }
        {
          filenames = [ "/var/lib/traefik/access.log" ];
          labels.type = "traefik";
        }
      ];
      general.api = {
        client = {
          credentials_path = "/var/lib/crowdsec/data/local_api_credentials.yaml";
        };
        server = {
          enable = true;
          listen_uri = "localhost:7422";
          online_client.credentials_path = "/var/lib/crowdsec/data/online_api_credentials.yaml";
        };
      };
      console.tokenFile = config.sops.secrets."crowdsec/console-enrollment-key".path;
    };
  };

  services.crowdsec-firewall-bouncer = {
    enable = true;
    registerBouncer.enable = false;
    secrets.apiKeyPath = config.sops.secrets."crowdsec/bouncer-api-key".path;
  };
}
