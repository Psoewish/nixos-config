{ ... }: {
  flake.modules.homeModules.helium = {
    programs.helium = {
      policies."ExtensionInstallForcelist" = [
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
        "fadndhdgpmmaapbmfcknlfgcflmmmieb" # FrankerFaceZ
        "iplffkdpngmdjhlpjmppncnlhomiipha" # Unpaywall
      ];
    };
  };
}
