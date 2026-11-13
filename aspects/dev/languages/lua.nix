{
  den.aspects.dev.languages.lua = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        lua-language-server
      ];
    };

    zed-extensions = ["lua"];
  };
}
