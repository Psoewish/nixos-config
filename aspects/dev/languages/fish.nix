{
  den.aspects.dev.languages.fish = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        fish-lsp
      ];
    };

    zed-extensions = ["fish"];
  };
}
