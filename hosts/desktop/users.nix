{
  pkgs,
  lib,
  ...
}: let
  username = "psoewish";
in {
  users.groups.${username} = {};
  users.users.${username} = {
    group = username;
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIh/C3Qmm+9EoNeiLUNsmpvqzGjNF6n0xNUpksIm3xUK"
    ];
  };

  imports = [
    (lib.mkAliasOptionModule ["home" "config"] ["home-manager" "users" username])
    (lib.mkAliasOptionModule ["root" "config"] ["home-manager" "users" "root"])
  ];
  home-manager.users.${username}.home.stateVersion = "26.11";
  home-manager.users.root.home.stateVersion = "26.11";
}
