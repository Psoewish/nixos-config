{
  flake.modules.nixos.core = { inputs, ... }: {
    imports =
      (with inputs.self.modules.nixos; [
        nixpkgs
        settings
        boot
        secrets
        home-manager
      ])
      ++ [ inputs.self.modules.generic.constants ];
  };
}
