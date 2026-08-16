{
  flake.modules.nixos.chromium = {pkgs, ...}: {
    nixpkgs.overlays = [
      (final: prev: {
        chromium = prev.chromium.override {
          commandLineArgs = [
            "--enable-features=VerticalTabs"
            "--show-avatar-button=never"
          ];
        };
      })
    ];

    environment.systemPackages = [pkgs.chromium];
    programs.chromium = {
      enable = true;
      defaultSearchProviderEnabled = true;
      defaultSearchProviderSearchURL = "https://qwant.com/?l=en&q={searchTerms}";

      # Policies
      extraOpts = {
        BrowserSignin = 0;
        SyncDisabled = true;
        PasswordManagerEnabled = false;
        MetricsReportingEnabled = false;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        RestoreOnStartup = true;
      };

      # First-run preferences
      initialPrefs = {
        vertical_tabs.enabled = true;
        homepage = "https://qwant.com/?l=en";
        homepage_is_newtabpage = true;
      };
      extensions = [
        # basically mandatory core extensions
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "fihnjjcciajhdojfnbdddfaoknhalnja" # I don't care about cookies
        "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
        "iplffkdpngmdjhlpjmppncnlhomiipha" # Unpaywall
        "fcbdnogkcfgejppcfcakldilfnfdlifp" # ClearURLs

        # Password manager
        "nngceckbapebfimnlniiiahkandclblb" # Bitwarden

        # Better Youtube/Twitch
        "gebbhagfogifgggkldgodflihgfeippi" # Return Youtube Dislike
        "fadndhdgpmmaapbmfcknlfgcflmmmieb" # FrankerFaceZ
        "nblkbiljcjfemkfjnhoobnojjgjdmknf" # PronounDB
        "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for Youtube
        "naipgebhooiiccifflecbffmnjbabdbh" # HyperChat

        # Games
        "dnhpnfgdlenaccegplpojghhmaamnnfp" # Augmented Steam
        "ngonfifpkpeefnhelnfdkficaiihklid" # ProtonDB for Steam
        "fkagelmloambgokoeokbpihmgpkbgbfm" # Indie Wiki Buddy

        # Git
        "ialbpcipalajnakfondkflpkagbkdoib" # Lovely forks
        "hlepfoohegkhhmjieoechaddaejaokhf" # Refined Github
        "giljefjcheohhamkjphiebfjnlphnokk" # Gitako
      ];
    };
  };
}
