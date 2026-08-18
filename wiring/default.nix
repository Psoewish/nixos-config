{
  flake.modules.nixos.core = {inputs, ...}: {
    imports = with inputs.self.modules.nixos; [
      nix-settings
      home-manager
      agenix
      flatpak
    ];
  };
}
