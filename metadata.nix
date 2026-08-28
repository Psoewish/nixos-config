{
  flake.metadata = rec {
    theme = "soft-server";

    primaryUser = {
      username = "psoewish";
      email = "personal@${domain}";
      shell = "fish";
    };

    domain = "psoewish.com";
    tunnelId = "009088b8-cd7c-41fb-b25d-2d34cd98bc6e";
  };
}
