{ config, ... }:
{
  services.matrix-tuwunel = {
    enable = true;
    settings = {
      global = {
        server_name = "matrix.psoewish.com";
        allow_registration = true;
        registration_token_file = config.sops.secrets."matrix/registration_token".path;
        well_known = {
          client = "https://matrix.psoewish.com";
          server = "matrix.psoewish.com:443";
        };
      };
    };
  };
  homelab.routes.tuwunel = {
    subdomain = "matrix";
    port = 6167;
    public = true;
  };
}
