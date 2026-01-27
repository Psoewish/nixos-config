{ username, ... }:
{
  home-manager.users.${username} = {
    programs.vesktop = {
      enable = true;
      vencord = {
        settings = {
          plugins = {
            alwaysTrust = {
              enable = true;
              domain = true;
              file = true;
            };
            anonymiseFileNames = {
              enable = true;
              anonymiseByDefault = true;
              method = "randomCharacters";
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
            betterNotesBox = {
              enable = true;
              hide = true;
              noSpellCheck = true;
            };
            betterUploadButton.enable = true;
            biggerStreamPreview.enable = true;
            callTimer = {
              enable = true;
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
              messages = "serverDefault";
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
      };
    };
  };
}
