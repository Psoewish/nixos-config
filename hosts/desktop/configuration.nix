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
      inputs.self.modules.nixos.core
      inputs.self.modules.nixos.${hostname}
    ];
  };
  flake.modules.nixos.${hostname}.imports =
    (with inputs.self.modules.generic; [psoewish])
    ++ # Optional modules
    (with inputs.self.modules.nixos; [
      vial
      streamcontroller
      input-remapper
      virtualisation
      helix
      zed
      cosmic
      fish
      nix-direnv
      fastfetch
      cli-tools
      git
      discord
      pear-desktop
      gaming
      qutebrowser
      firefox
      obs
      stylix
    ]);
}
