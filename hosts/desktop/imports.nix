{inputs, ...}: {
  imports = with inputs.self.modules.nixos; [
    discord
    gaming
    git
    helium
    pear-desktop
    podman
    nix-ld
    fish
    foot
    zed
    helix
    lsp
    direnv

    mango
  ];
}
