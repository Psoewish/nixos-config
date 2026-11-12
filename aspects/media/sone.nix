{
  den.aspects.media.sone = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.sone];
    };
  };
}
