{
  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;
  nix.settings = {
    trusted-users = ["root" "@wheel"];
    experimental-features = ["nix-command" "flakes"];
  };
}
