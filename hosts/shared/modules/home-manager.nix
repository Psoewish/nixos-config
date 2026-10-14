toplevel @ {...}: {
  flake.modules.nixos.shared = {
    imports = [
      toplevel.inputs.home-manager.nixosModules.home-manager
      (toplevel.lib.mkAliasOptionModule ["hm"] ["home-manager" "users" toplevel.config.flake.meta.primaryUser.username])
    ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "bak";
      overwriteBackup = true;
      extraSpecialArgs = {inherit (toplevel) inputs;};
      users.${toplevel.config.flake.meta.primaryUser.username}.home = {
        username = toplevel.config.flake.meta.primaryUser.username;
        homeDirectory = "/home/${toplevel.config.flake.meta.primaryUser.username}";
        stateVersion = "26.11";
      };
    };
  };
}
