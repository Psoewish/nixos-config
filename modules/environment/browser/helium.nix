{inputs, ...}: {
  imports = [inputs.helium.nixosModules.default];
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
        "dnhpnfgdlenaccegplpojghhmaamnnfp" # Augmented Steam
        "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
        "fihnjjcciajhdojfnbdddfaoknhalnja" # I don't care about cookies
        "fkagelmloambgokoeokbpihmgpkbgbfm" # Indie Wiki Buddy
        "ialbpcipalajnakfondkflpkagbkdoib" # Lovely forks
        "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
        "ngonfifpkpeefnhelnfdkficaiihklid" # ProtonDB for Steam
        "hlepfoohegkhhmjieoechaddaejaokhf" # Refined Github
        "gebbhagfogifgggkldgodflihgfeippi" # Return Youtube Dislike
        "jmmjjcddjldjdjgckdiokhfokccdnekc" # Sonarr/Radarr/Lidarr autosearch
        "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for Youtube
        "iplffkdpngmdjhlpjmppncnlhomiipha" # Unpaywall
      ];
    };
  };
}
