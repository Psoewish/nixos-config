{inputs, ...}: {
  imports = with inputs.self.modules.nixos; [
    cli
    deploy-rs
    discord
    fish
    foot
    fuzzel
    gaming
    git
    helium
    helix
    hyprland
    lsp
    nautilus
    pear-desktop
    podman
    zed
  ];
}
