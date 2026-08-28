toplevel @ {config, ...}: {
  flake.modules.nixos.shared = {
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
        trusted-users = ["root" toplevel.config.flake.metadata.primaryUser.username];
        auto-optimise-store = true;
        substituters = ["https://aseipp-nix-cache.global.ssl.fastly.net"];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}
