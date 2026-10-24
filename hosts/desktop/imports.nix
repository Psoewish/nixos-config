{inputs, ...}: {
  imports = with inputs.self.modules.nixos; [
    # deploy-rs
    discord
    gaming
    git
    helium
    pear-desktop
    podman
    security
    nix-ld

    terminal
    editors
    direnv

    mango
  ];
}
