{ ... }: {
  flake.modules.homeManager.discord = {
    programs.nixcord.config.plugins = {
      accountPanelServerProfile = {
        enable = true;
        prioritizeServerProfile = true;
      };
      alwaysExpandRoles = {
        enable = true;
        hideArrow = true;
      };
      alwaysTrust = {
        enable = true;
        domain = true;
        file = true;
      };
      betterFolders = {
        enable = true;
        sidebar = true;
        sidebarAnim = true;
        closeAllFolders = false;
        closeAllHomeButton = false;
        closeOthers = false;
        forceOpen = false;
        keepIcons = false;
        showFolderIcon = "moreThanOne";
      };
      betterUploadButton.enable = true;
      biggerStreamPreview.enable = true;
      callTimer = {
        enable = true;
        allCallTimers = true;
        trackSelf = true;
        format = "stopwatch";
      };
      clearURLs.enable = true;
      copyFileContents.enable = true;
      crashHandler = {
        enable = true;
        attemptToPreventCrashes = true;
      };
      disableCallIdle.enable = true;
      favoriteEmojiFirst.enable = true;
      fixCodeblockGap.enable = true;
      fixImagesQuality.enable = true;
      fixSpotifyEmbeds = {
        enable = true;
        volume = 10.0;
      };
      fixYoutubeEmbeds.enable = true;
      forceOwnerCrown.enable = true;
      fullSearchContext.enable = true;
      gameActivityToggle = {
        enable = true;
        oldIcon = false;
      };
      keepCurrentChannel.enable = true;
      memberCount = {
        enable = true;
        toolTip = true;
        memberList = true;
      };
      mentionAvatars = {
        enable = true;
        showAtSymbol = true;
      };
      messageLatency = {
        enable = true;
        latency = 2;
        detectDiscordKotlin = true;
        showMillis = true;
      };
      messageLinkEmbeds = {
        enable = true;
        automodEmbeds = "never";
      };
      newGuildSettings = {
        enable = true;
        guild = true;
        messages = 1;
        everyone = true;
        role = true;
        highlights = true;
        events = true;
        showAllChannels = true;
      };
      noF1.enable = true;
      noOnboardingDelay.enable = true;
      onePingPerDM = {
        enable = true;
        channelToAffect = "both_dms";
        allowMentions = true;
        allowEveryone = true;
      };
      openInApp = {
        enable = true;
        spotify = true;
        steam = true;
        epic = true;
      };
      pauseInvitesForever.enable = true;
      plainFolderIcon.enable = true;
      replaceGoogleSearch = {
        enable = true;
        customEngineName = "DuckDuckGo";
        customEngineURL = "https://duckduckgo.com/";
      };
      reverseImageSearch.enable = true;
      spotifyControls.enable = true;
      spotifyShareCommands.enable = true;
      userMessagesPronouns = {
        enable = true;
        pronounsFormat = "LOWERCASE";
        showSelf = true;
      };
      webKeybinds.enable = true;
      webScreenShareFixes.enable = true;
      youtubeAdblock.enable = true;
    };
  };
}
