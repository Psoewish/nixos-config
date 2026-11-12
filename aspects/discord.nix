{
  den.aspects.discord = {
    homeManager = {pkgs, ...}: {
      programs.discord = {
        enable = true;
        package = pkgs.discord.override {
          withVencord = true;
        };
      };
    };
  };
}
