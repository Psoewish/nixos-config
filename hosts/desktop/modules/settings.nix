{meta, ...}: {
  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
    settings = {
      trusted-users = ["root" meta.primaryUser];
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
  };
}
