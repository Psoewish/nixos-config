{
  config.flake.global = rec {
    primaryUser = "psoewish";
    personal = {
      username = primaryUser;
      email = "personal@psoewish.com";
    };

    domain = "psoewish.com";
    cloudflared.tunnelId = "009088b8-cd7c-41fb-b25d-2d34cd98bc6e";
    admin.email = "admin@psoewish.com";
  };
}
