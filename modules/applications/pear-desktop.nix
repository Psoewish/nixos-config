{
  flake.modules.nixos.pear-desktop = {inputs, ...}: {
    home-manager.sharedModules = [inputs.self.modules.homeManager.youtube-music];
  };

  flake.modules.homeManager.youtube-music = {inputs, ...}: {
    imports = [(inputs.pear-desktop.homeManagerModules.default or {})];
    programs.pear-desktop = {
      enable = true;
      options = {
        appVisible = true;
        startingPage = "Home";
        tray = true;
      };
      plugins = {
        album-color-theme.enable = true;
        blur-nav-bar.enable = true;
        crossfade.enable = true;
        discord = {
          enable = true;
          hideGitHubButton = true;
        };
        scrobbler = {
          enable = true;
          scrobblers.listenbrainz = {
            enable = true;
            apiRoot = "https://api.listenbrainz.org/1/";
            # token = "config.age.secrets.listenbrainz.path";
          };
        };
      };
    };
  };
}
