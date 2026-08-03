{
  flake.modules.nixos.core = { inputs, ... }: {
    imports =
      (with inputs.self.modules.nixos; [
        nixpkgs
        settings
        boot
        locale
        secrets
        home-manager
        nix-ld
        network
        ssh
      ])
      ++ [ inputs.self.modules.generic.constants ];
  };
}
