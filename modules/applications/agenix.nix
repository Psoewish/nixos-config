toplevel @ {
  inputs,
  config,
  ...
}: {
  imports = [(inputs.agenix-rekey.flakeModule or {})];

  flake.modules.nixos.agenix = {
    inputs,
    config,
    ...
  }: {
    imports = [
      (inputs.agenix.nixosModules.default or {})
      (inputs.agenix-rekey.nixosModules.default or {})
      (inputs.self.modules.nixos.secrets or {})
    ];

    age.rekey = {
      masterIdentities = ["/home/${toplevel.config.flake.metadata.primaryUser.username}/.ssh/id_ed25519"];
      storageMode = "derivation";
      hostPubkey =
        if config.networking.hostName == "desktop"
        then "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF0Ab3o9NKMJT15F3bpwMReI2dIEUxOb0qI2PNMVx8Mg"
        else "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOAKGYMNaCK17QYNwe4PUJ+6INU303baKyMqzYnpMS5R";
    };
  };
}
