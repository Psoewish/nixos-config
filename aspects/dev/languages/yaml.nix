{
  den.aspects.dev.languages.yaml = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        yaml-language-server
      ];
    };
  };
}
