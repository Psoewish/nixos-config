{
  lib,
  inputs,
  config,
  ...
}: {
  config.flake.nixosConfigurations = lib.mapAttrs (hostname: hostData:
    inputs.nixpkgs.lib.nixosSystem {
      system = hostData.system; # For legacy support
      specialArgs = {
        inherit inputs;
        hosts = lib.foldl' (acc: classHosts: acc // classHosts) {} (lib.attrValues config.flake.hosts);
        global = config.flake.global;
        routes = config.flake.routes;
      };
      modules =
        [
          {
            # System setup
            networking.hostName = hostData.hostname;
            system.stateVersion = hostData.stateVersion;
            nixpkgs.hostPlatform = hostData.system;
            security.sudo.wheelNeedsPassword = false;

            # User setup
            users.groups = lib.mapAttrs (username: userData: {gid = userData.id;}) hostData.users;
            users.users =
              lib.mapAttrs (username: userData: {
                group = username;
                description = username;
                uid = userData.id;
                isNormalUser = userData.isPrimary || userData.isAdmin || userData.enableHomeManager;
                isSystemUser = !(userData.isPrimary || userData.isAdmin || userData.enableHomeManager);
                shell = inputs.nixpkgs.legacyPackages.${hostData.system}.${userData.shell};
                extraGroups = userData.extraGroups ++ lib.optionals (userData.isPrimary || userData.isAdmin) ["wheel" "networkmanager"];
              })
              hostData.users;

            nix.settings.trusted-users = ["root"] ++ lib.attrNames (lib.filterAttrs (username: userData: userData.isPrimary || userData.isAdmin) hostData.users);

            home-manager.users = lib.mapAttrs (username: userData: {
              home = {
                inherit username;
                homeDirectory = "/home/${username}";
                stateVersion = hostData.stateVersion;
              };
            }) (lib.filterAttrs (username: userData: userData.isPrimary || userData.enableHomeManager) hostData.users);
          }
        ]
        ++ [
          config.flake.modules.nixos.core
          config.flake.modules.nixos.${hostname}
        ];
    })
  config.flake.hosts.nixos;
}
