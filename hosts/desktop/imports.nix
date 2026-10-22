{inputs, ...}: {
  imports = with inputs.self.modules.nixos; [
    deploy-rs
    discord
    gaming
    git
    helium
    pear-desktop
    podman

    terminal
    editors

    mango
  ];
}
