{
  den.aspects.dev.languages.bash = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        bash-language-server
      ];
    };
  };
}
