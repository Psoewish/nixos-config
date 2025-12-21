{ inputs, config, ... }:
{
  imports = [ inputs.authentik.nixosModules.default ];
  services.authentik = {
    enable = true;
    environmentFile = config.sops.secrets."authentik/env".path;
    settings = {
      email = {
        host = "smtp.fastmail.com";
        port = 465;
        username = "psoewish@fastmail.com";
        use_tls = false;
        use_ssl = true;
        from = "noreply@psoewish.com";
      };
    };
  };
  homelab.routes.authentik = {
    subdomain = "sso";
    port = 9000;
    public = true;
  };
}
