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
    pear-desktop
    podman
    zed
    fastfetch

    mango
  ];
}
