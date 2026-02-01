{
  personal = {
    username = "psoewish";
    email = "personal@psoewish.com";
  };

  homelab = {
    domain = "psoewish.com";
    tunnelId = "009088b8-cd7c-41fb-b25d-2d34cd98bc6e";
    email = "admin@psoewish.com";
    service = import ./service-template.nix;
  };
}
