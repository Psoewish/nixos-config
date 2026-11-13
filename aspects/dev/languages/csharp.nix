{
  den.aspects.dev.languages.csharp = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        csharp-ls
      ];
    };

    zed-extensions = ["csharp"];
  };
}
