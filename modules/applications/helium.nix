toplevel @ {...}: {
  flake.modules.nixos.helium = {
    imports = [toplevel.inputs.helium.nixosModules.default];
    programs.helium = {
      enable = true;
      flags = ["--show-avatar-button=never"];
      policies = {
        "ShowHomeButton" = true;
        "BrowserSignin" = 0;
        "PasswordManagerEnabled" = false;
        "SyncDisabled" = true;
        "HomepageLocation" = "https://duckduckgo.com";
        "DefaultSearchProviderEnabled" = true;
        "DefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q={searchTerms}";
        "RestoreOnStartup" = 1;
        "ExtensionInstallForcelist" = [
          # Core features
          "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
          "fihnjjcciajhdojfnbdddfaoknhalnja" # I don't care about cookies
          "fkagelmloambgokoeokbpihmgpkbgbfm" # Indie Wiki Buddy
          "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger

          # Twitch
          "fadndhdgpmmaapbmfcknlfgcflmmmieb" # FrankerFaceZ

          # Youtube
          "ajopnjidmegmdimjlfnijceegpefgped" # BetterTTV
          "ponfpcnoihfmfllpaingbgckeeldkhle" # Enhancer for YouTube
          "gebbhagfogifgggkldgodflihgfeippi" # Return Youtube Dislike
          "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for Youtube

          # Steam
          "dnhpnfgdlenaccegplpojghhmaamnnfp" # Augmented Steam
          "ngonfifpkpeefnhelnfdkficaiihklid" # ProtonDB for Steam

          # Github
          "hlepfoohegkhhmjieoechaddaejaokhf" # Refined Github
          "ialbpcipalajnakfondkflpkagbkdoib" # Lovely forks
        ];
      };
    };
  };
}
