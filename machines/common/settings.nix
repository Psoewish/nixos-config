{
  den.aspects.common.settings.nixos = {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
