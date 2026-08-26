{
  flake.modules.nixos.nix-settings = {
    nixpkgs = {
      config.allowUnfree = true;
      # overlays = [
      #   (final: prev: {
      #     stable = import inputs.nixpkgs-stable {
      #       system = final.system;
      #       config.allowUnfree = true;
      #     };
      #   })
      # ];
    };

    nix = {
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
      optimise.automatic = true;
      settings = {
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
