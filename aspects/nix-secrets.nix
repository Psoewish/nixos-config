{inputs, ...}: {
  den.aspects.nix-secrets = {
    nixos = {user, ...}: {
      imports = [inputs.nix-secrets.nixosModules.default];
      security.nix-secrets = {
        enable = true;
        storage = inputs.secrets;
        storagePath = "/home/${user.name}/secrets";
        identityPaths = ["/home/${user.name}/.ssh/id_ed25519"];

        defaultRecipients = ["psoewish"];
        recipientAliases = {
          psoewish = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIh/C3Qmm+9EoNeiLUNsmpvqzGjNF6n0xNUpksIm3xUK";
          nausicaa = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJGi4fQO6sUV216jFULglr8ghluaJu98252kuZ2SnXLU";
          mononoke = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOAKGYMNaCK17QYNwe4PUJ+6INU303baKyMqzYnpMS5R";
        };

        secrets = {
          "cloudflare/api".recipients = ["mononoke"];
          "nzbget/password".recipients = ["mononoke"];
          "prowlarr/api".recipients = ["mononoke"];
          "radarr/api".recipients = ["mononoke"];
          "eweka/username".recipients = ["mononoke"];
          "eweka/password".recipients = ["mononoke"];
          "sonarr/api".recipients = ["mononoke"];
          "vaultwarden/admin_token".recipients = ["mononoke"];
          "vaultwarden/smtp_password".recipients = ["mononoke"];
          "wud/password".recipients = ["mononoke"];
          "silo/secret_key".recipients = ["mononoke"];
        };
      };
    };
  };
}
