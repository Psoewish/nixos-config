{
  den.aspects.gaming.faugus = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = [pkgs.faugus-launcher];
    };
  };
}
