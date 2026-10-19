rec {
  flakeRoot = "/home/${primaryUser}/Projects/flake-parts";
  primaryUser = "psoewish";
  defaultSession = "hyprland";

  git = {
    name = primaryUser;
    email = "personal@psoewish.com";
  };
}
