{ username, pkgs, ... }:
{
  fractal.tags = [ "core" ];
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

  home-manager.users.${username} =
    { osConfig, inputs, ... }:
    {
      imports = with inputs; [
        spicetify-nix.homeManagerModules.default
        zen-browser.homeModules.twilight
      ];
      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = osConfig.system.stateVersion;
    };
}
