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
      masterIdentities = ["/home/psoewish/.ssh/id_ed25519"];
      storageMode = "derivation";
      hostPubkey = toplevel.config.hosts.nixos.${config.networking.hostName}.pubKey;
    };
  };
}
