{
  flake-file.inputs = {
    firefox-extensions.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-extensions.inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.firefox = {inputs, ...}: {
    home-manager.sharedModules = [inputs.self.modules.homeManager.firefox];
  };

  flake.modules.homeManager.firefox = {
    inputs,
    pkgs,
    ...
  }: {
    programs.firefox = {
      enable = true;
      profiles.default = {
        settings = {
          "extensions.autoDisableScopes" = 0;
          "sidebar.verticalTabs" = true;
        };
        extensions = {
          force = true;
          packages = with inputs.firefox-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
            clearurls
            indie-wiki-buddy
            lovely-forks
            no-pdf-download
            pronoundb
            protondb-for-steam
            privacy-badger
            return-youtube-dislikes
            augmented-steam
            sponsorblock
            istilldontcareaboutcookies
            refined-github
            sonarr-radarr-lidarr-search
            unpaywall
            bitwarden
          ];
        };
      };
    };
  };
}
