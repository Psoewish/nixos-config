{ ... }:
{
  programs.chromium = {
    enable = true;
    extensions = [
      {
        id = "dnhpnfgdlenaccegplpojghhmaamnnfp"; # Augmented Steam
      }
      {
        id = "nngceckbapebfimnlniiiahkandclblb"; # bitwarden
      }
      {
        id = "fihnjjcciajhdojfnbdddfaoknhalnja"; # I don't care about cookies
      }
      {
        id = "fkagelmloambgokoeokbpihmgpkbgbfm"; # Indie Wiki Buddy
      }
      {
        id = "ialbpcipalajnakfondkflpkagbkdoib"; # Lovely forks
      }
      {
        id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; # Privacy Badger
      }
      {
        id = "ngonfifpkpeefnhelnfdkficaiihklid"; # ProtonDB for Steam
      }
      {
        id = "hlepfoohegkhhmjieoechaddaejaokhf"; # Refined Github
      }
      {
        id = "gebbhagfogifgggkldgodflihgfeippi"; # Return Youtube Dislike
      }
      {
        id = "jmmjjcddjldjdjgckdiokhfokccdnekc"; # Sonarr/Radarr/Lidarr autosearch
      }
      {
        id = "mnjggcdmjocbbbhaepdhchncahnbgone"; # SponsorBlock for Youtube
      }
      {
        id = "iplffkdpngmdjhlpjmppncnlhomiipha"; # Unpaywall
      }
    ];
  };
}
