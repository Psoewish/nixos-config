{
  username,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  users.users = {
    root.shell = pkgs.fish;
    ${username} = {
      shell = pkgs.fish;
      isNormalUser = true;
      description = username;
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "render"
      ];
    };
  };

  security.sudo.wheelNeedsPassword = false;
  nix.settings.trusted-users = [
    "root"
    username
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = { inherit inputs username; };
    backupCommand = "${pkgs.trash-cli}/bin/trash";
    users.${username} = {
      home = {
        username = username;
        homeDirectory = "/home/${username}";
        stateVersion = "25.11";
      };
      imports =
        (inputs.import-tree.filter (lib.hasSuffix "default.nix") ../../modules/desktop/home).imports;
    };
  };
}
