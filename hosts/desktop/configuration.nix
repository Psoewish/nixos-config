{inputs, ...}: let
  hostname = "desktop";
  system = "x86_64-linux";
  stateVersion = "26.05";
in {
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules = [
      {
        networking.hostName = hostname;
        system.stateVersion = stateVersion;
        nixpkgs.hostPlatform = system;
        security.sudo.wheelNeedsPassword = false;
        nix.settings.trusted-users = ["root" "psoewish"];
      }
      inputs.self.modules.nixos.${hostname}
    ];
  };
  flake.modules.nixos.${hostname}.imports =
    (with inputs.self.modules.generic; [psoewish])
    ++ # Optional modules
    (with inputs.self.modules.nixos; [
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
    ]);
}
