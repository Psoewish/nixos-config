{pkgs, ...}: {
  home.config.programs.discord = {
    enable = true;
    package = pkgs.discord.override {
      withVencord = true;
    };
  };
}
