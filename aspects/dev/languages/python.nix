{
  den.aspects.dev.languages.python = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        tombi
      ];
    };

    zed-extensions = ["toml"];
  };
}
