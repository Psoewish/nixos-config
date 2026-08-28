{inputs, ...}: {
  flake.hosts.nixos.desktop = {
    system = "x86_64-linux";
    stateVersion = "26.05";
    staticIp = "192.168.1.16";
  };

  flake.modules.nixos.desktop.imports = with inputs.self.modules.nixos; [
    agenix

    cosmic
    # gnome
    # hyprland

    stylix

    cli-tools
    fish
    git
    helix
    zed
    virtualisation
    nix-direnv
    flatpak

    # chromium
    firefox
    qutebrowser

    input-remapper
    streamcontroller
    vial

    discord
    gaming
    obs
    pear-desktop
  ];
}
