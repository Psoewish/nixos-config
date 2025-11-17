{
  hostname,
  stateVersion,
  ...
}:
{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
    settings.auto-optimise-store = true;
    settings.experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];
  };

  nixpkgs.config.allowUnfree = true;
  networking.hostName = hostname;
  system.stateVersion = stateVersion;
}
