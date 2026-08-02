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
        flatpak
        nix-ld
      ])
      ++ [ inputs.self.modules.generic.constants ];
  };
}
