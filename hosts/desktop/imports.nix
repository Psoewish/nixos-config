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
    pear-desktop
    podman
    fastfetch

    editors

    mango
  ];
}
