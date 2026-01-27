{ ... }:
{
  services.crowdsec = {
    enable = true;
    autoUpdateService = true;

    hub = {
      collections = [
        "crowdsecurity/linux"
        "crowdsecurity/caddy"
        "crowdsecurity/http-cve"
        "crowdsecurity/whitelist-good-actors"
      ];
    };
    localConfig = {
      acquisitions = [
        {
          source = "journalctl";
          journalctl_filter = [ "_SYSTEMD_UNIT=sshd.service" ];
          labels.type = "syslog";
        }
        {
          source = "file";
          filenames = [ "/var/log/caddy/*.log" ];
          labels.type = "caddy";
        }
      ];
    };
    settings = {
      general.api.server = {
        enable = true;
        listen_uri = "localhost:7422";
      };
      lapi.credentialsFile = "/var/lib/crowdsec/data/lapi.yaml";
    };
  };

  services.crowdsec-firewall-bouncer = {
    enable = true;
    registerBouncer.enable = true;
  };
}
