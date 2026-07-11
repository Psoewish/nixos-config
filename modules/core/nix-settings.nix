{ ... }:
{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;
  nix.settings.trusted-users = [
    "root"
    "psoewish"
  ];
}
