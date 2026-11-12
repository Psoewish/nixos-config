{
  den.aspects.common.nh.nixos = {
    programs.nh = {
      enable = true;
      flake = "/home/psoewish/nixos-config";
      clean = {
        enable = true;
        extraArgs = "--keep 10 --keep-since 7d --optimise";
        dates = "weekly";
      };
    };
    nix.settings.auto-optimise-store = true;
  };
}
