{
  inputs,
  lib,
  meta,
  ...
}: let
  inherit (lib) attrNames filterAttrs genAttrs hasPrefix mkDefault mapAttrs;
  inherit (builtins) readDir attrValues;
in {
  flake.nixosConfigurations =
    genAttrs
    (attrNames (filterAttrs (name: type: type == "directory" && !hasPrefix "_" name) (readDir ../hosts)))
    (hostname:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs meta;};
        modules =
          [
            {networking.hostName = mkDefault hostname;}
            (inputs.import-tree ../hosts/${hostname})
          ]
          # Automatic user generation
          ++ (attrValues (genAttrs
            (attrNames (filterAttrs (name: type: type == "directory" && !hasPrefix "_" name && name != "root") (readDir ../homes)))
            (username: {pkgs, ...}: let
              userData = meta.users.${username} or {};
            in {
              users.groups."${username}" = {};
              users.users.${username} = {
                group = username;
                isNormalUser = true;
                extraGroups =
                  (
                    if username == meta.primaryUser
                    then ["wheel" "networkmanager"]
                    else []
                  )
                  ++ (userData.groups or []);
                shell = pkgs.${userData.shell or "fish"};
                openssh.authorizedKeys.keys =
                  if username == meta.primaryUser
                  then ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIh/C3Qmm+9EoNeiLUNsmpvqzGjNF6n0xNUpksIm3xUK"]
                  else (userData.sshKeys or []);
              };
            })));
      });

  flake.deploy.nodes =
    mapAttrs (hostname: host: {
      inherit hostname;
      profiles =
        {
          system = {
            user = "root";
            path = inputs.deploy-rs.lib.x86_64-linux.activate.nixos host;
          };
        }
        // mapAttrs (user: home: {
          inherit user;
          path = inputs.deploy-rs.lib.x86_64-linux.activate.home-manager home;
        })
        inputs.self.homeConfigurations;
      profilesOrder = ["system"];
    })
    inputs.self.nixosConfigurations;

  flake.checks.x86_64-linux = inputs.deploy-rs.lib.x86_64-linux.deployChecks inputs.self.deploy;
}
