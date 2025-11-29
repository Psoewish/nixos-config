{ config, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    settings = {
      title = "Homepage";
      description = "My super cool dashboard";
      headerStyle = "clean";
    };
    bookmarks = [ ];
    widgets = [ ];
    services = [
      {
        widget = {
          type = "cloudflared";
          accountid = "accountid";
          tunnelid = "${config.sops.secrets."cloudflare/tunnelId".path}";
          key = "${config.sops.secrets."cloudflare/api".path}";
        };
      }
    ];
  };

  homelab.routes.homepage-dashboard = {
    subdomain = "homepage";
    port = 8082;
    public = true;
  };
}
