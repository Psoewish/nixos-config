{inputs, ...}: {
  imports = with inputs.self.modules.nixos; [
    cli
    deploy-rs
    discord
    fish
    foot
    gaming
    git
    helium
    helix
    lsp
    nautilus
    pear-desktop
    podman
    zed
    fastfetch
    style

    mango
  ];
}
