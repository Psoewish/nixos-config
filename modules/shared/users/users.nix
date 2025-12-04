{ username, ... }:
{
  users.users = {
    ${username} = {
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

  home-manager.users.${username} = {
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "25.05";
  };
}
