{
  flake.modules.nixos.core = {
    nixpkgs.config.allowUnfree = true;
    nix = {
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
      optimise.automatic = true;
      settings.auto-optimise-store = true;
    };
  };
}
