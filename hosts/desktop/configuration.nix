{inputs, ...}: {
  flake.hosts.nixos.desktop = {
    system = "x86_64-linux";
    stateVersion = "26.05";
    staticIp = "192.168.1.16";
  };

  flake.modules.nixos.desktop.imports = with inputs.self.modules.nixos; [
    greeter
    hyprland

    stylix

    cli-tools
    fish
    git
    helix
    zed
    # flatpak
    foot

    helium

    vesktop
    gaming
    obs
    pear-desktop
  ];
}
