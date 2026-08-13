{inputs, ...}: {
  imports = [(inputs.agenix-rekey.flakeModule or {})];

  flake.modules.nixos.core = {
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
      masterIdentities = ["/home/psoewish/.ssh/id_ed25519"];
      storageMode = "derivation";
      hostPubkey = config.hosts.${config.networking.hostName}.pubKey;
    };
  };
}
