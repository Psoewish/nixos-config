{
  flake.modules.nixos.settings = {
    nix.settings.experimental-features = [
      "nix-command"
      "flake"
    ];
  };
}
