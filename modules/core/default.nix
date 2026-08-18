{
  flake.modules.nixos.core = {inputs, ...}: {
    imports = with inputs.self.modules.nixos; [
      agenix
      boot
      cli-tools
      flatpak
      git
      home-manager
      locale
      network
      nix-ld
      nixpkgs
      settings
      ssh
    ];
  };
}
