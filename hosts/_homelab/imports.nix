{inputs, ...}: {
  imports = with inputs.self.modules.nixos; [
    cli
    fish
    git
    helix
    podman
  ];
}
