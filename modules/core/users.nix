{pkgs, ...}: {
  users.users."psoewish" = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "psoewish";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "render"
    ];
  };

  security.sudo.wheelNeedsPassword = false;
  nix.settings.trusted-users = [
    "root"
    "psoewish"
  ];
}
