{
  flake.modules.nixos.chromium = {
    pkgs,
    lib,
    ...
  }: {
    environment.systemPackages = [
      (pkgs.chromium.override
        {
          commandLineArgs = [
            "--enable-features=${lib.concatStringsSep "," [
              "VerticalTabs"
              "WebContentsForceDark"
            ]}"
            "--use-gl"
            "--use-angle=vulkan"
            "--ignore-gpu-blocklist"
            "--enable-gpu-rasterization"
            "--enable-zero-copy"
          ];
        })
    ];

    programs.chromium = {
      enable = true;
      defaultSearchProviderEnabled = true;
      defaultSearchProviderSearchURL = "https://duckduckgo.com/?q={searchTerms}";

      # Policies
      extraOpts = {
        BrowserSignin = 0;
        SyncDisabled = true;
        PasswordManagerEnabled = false;
        MetricsReportingEnabled = false;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        RestoreOnStartup = 1;
      };

      # First-run preferences
      initialPrefs = {
        vertical_tabs.enabled = true;
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
