toplevel @ {
  inputs,
  config,
  ...
}: let
  hostname = "homelab";
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
        nix.settings.trusted-users = ["root" toplevel.config.flake.metadata.username];
      }
      inputs.self.modules.nixos.${hostname}
    ];
  };
  flake.modules.nixos.${hostname}.imports =
    (with inputs.self.modules.generic; [psoewish media])
    ++ # Optional modules
    (with inputs.self.modules.nixos; [
      agenix

      fish
      cli-tools
      git
      helix

      docker

      blocky
      cloudflared
      traefik
      unbound

      jellyfin
      jellyseerr
      vaultwarden

      nzbhydra
      profilarr
      prowlarr
      radarr
      sabnzbd
      sonarr
      transmission
    ]);
}
