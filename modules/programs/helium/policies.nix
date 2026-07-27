{ ... }: {
  flake.modules.homeModules.helium = {
    programs.helium = {
      policies = {
        "ShowHomeButton" = true;
        "BrowserSignin" = 0;
        "PasswordManagerEnabled" = false;
        "SyncDisabled" = true;
        "HomepageLocation" = "https://duckduckgo.com";
        "DefaultSearchProviderEnabled" = true;
        "DefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q={searchTerms}";
        "RestoreOnStartup" = 1;
      };
    };
  };
}
