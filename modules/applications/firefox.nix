{
  flake.modules.nixos.firefox = {inputs, ...}: {
    imports = [inputs.nur.modules.nixos.default];
    home-manager.sharedModules = [inputs.self.modules.homeManager.firefox];
  };

  flake.modules.homeManager.firefox = {
    pkgs,
    config,
    ...
  }: {
    programs.firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
      profiles.default = {
        name = "default";
        id = 0;
        isDefault = true;
        settings = {
          "extensions.autoDisableScopes" = 0;
          "sidebar.verticalTabs" = true;
          "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
          "browser.startup.page" = 3;
          "browser.ai.control.default" = "blocked";
          "browser.ai.control.linkPreviewKeyPoints" = "blocked";
          "browser.ai.control.pdfjsAltText" = "blocked";
          "browser.ai.control.sidebarChatbot" = "blocked";
          "browser.ai.control.smartTabGroups" = "blocked";
          "browser.ai.control.smartWindow" = "blocked";
          "browser.ai.control.translations" = "blocked";
          "browser.dataFeatureRecommendations.enabled" = false;
          "browser.discovery.containers.enabled" = false;
        };
        extensions = {
          force = true;
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            # basically mandatory core extensions
            adblocker-ultimate
            istilldontcareaboutcookies
            privacy-badger
            unpaywall
            clearurls

            # Password manager
            bitwarden

            # Better Youtube/Twitch
            return-youtube-dislikes
            frankerfacez
            betterttv
            pronoundb
            sponsorblock

            # Misc QoL
            augmented-steam
            protondb-for-steam
            indie-wiki-buddy

            # Git
            refined-github
            lovely-forks
            gitako-github-file-tree
          ];
        };
      };
    };
  };
}
