{
  inputs,
  username,
  ...
}:
{
  home-manager.users.${username} = {
    imports = [ inputs.noctalia.homeModules.default ];

    programs.noctalia-shell = {
      enable = true;
      systemd.enable = false;
      settings = {
        applauncher = {
          customLaunchPrefix = "uwsm app --";
          customLaunchPrefixEnabled = true;
          enableClipboardHistory = false;
          pinnedExecs = [ ];
          position = "center";
          sortByMostUsed = true;
          terminalCommand = "uwsm app -- ghostty -e";
          useApp2Unit = false;
          viewMode = "grid";
        };
        audio = {
          cavaFrameRate = 60;
          mprisBlacklist = [ ];
          preferredPlayer = "spotify";
          volumeOverdrive = false;
          volumeStep = 5;
        };
        bar = {
          density = "default";
          exclusive = true;
          floating = true;
          marginHorizontal = 1.05;
          marginVertical = 1.05;
          monitors = [ "DP-1" ];
          outerCorners = false;
          position = "top";
          showCapsule = false;
          widgets = {
            left = [
              {
                id = "Workspace";
                labelMode = "index";
                hideUnoccupied = false;
                characterCount = 2;
              }
            ];
            center = [
              {
                id = "Clock";
                useCustomFont = false;
                customFont = "";
                usePrimaryColor = true;
                formatHorizontal = "MMM dd | HH:mm";
                formatVertical = "";
              }
            ];
            right = [
              {
                id = "Tray";
                colorizeIcons = true;
                drawerEnabled = true;
                favorites = [ ];
                blacklist = [ ];
              }
              {
                id = "NotificationHistory";
                hideWhenZero = true;
                showUnreadBadge = true;
              }
              {
                id = "Volume";
                displayMode = "onhover";
              }
              {
                id = "ControlCenter";
                useDistroLogo = false;
                icon = "noctalia";
                customIconPath = "";
              }
            ];
          };
        };
        colorSchemes = {
          darkMode = true;
          generateTemplatesForPredefined = false;
          predefinedScheme = "Rosepine";
        };
        controlCenter = {
          Cards = [
            {
              id = "profile-card";
              enabled = true;
            }
            {
              id = "shortcuts-card";
              enabled = false;
            }
            {
              id = "audio-card";
              enabled = true;
            }
            {
              id = "weather-card";
              enabled = true;
            }
            {
              id = "media-sysmon-card";
              enabled = true;
            }
          ];
          position = "close_to_bar_button";
        };
        dock = {
          enabled = false;
        };
        general = {
          avatarImage = ../../../assets/.face;
          dimmerOpacity = 0.2;
          enableShadows = false;
          animationDisabled = false;
          animationSpeed = 1;
          compactLockScreen = false;
          showScreenCorners = false;
          lockOnSuspend = false;
          radiusRatio = 0;
        };
        hooks = {
          enabled = false;
        };
        location = {
          name = "Brussels, Belgium";
          firstDayOfWeek = 1;
          showCalendarEvents = true;
          showCalendarWeather = true;
          use12hourFormat = false;
          useFahrenheit = false;
          weatherEnabled = true;
        };
        network = {
          wifiEnabled = true;
        };
        nightLight = {
          enabled = false;
        };
        notifications = {
          enabled = true;
          monitors = [ "DP-1" ];
          location = "top_right";
        };
        osd = {
          enabled = true;
          monitors = [ "DP-1" ];
          location = "top_right";
        };
        screenRecorder = { };
        ui = {
          fontDefault = "Roboto";
          fontFixed = "CaskaydiaCove Nerd Font";
          panelsAttachedToBar = true;
          settingsPanelAttachToBar = true;
          tooltipsEnabled = true;
        };
        wallpaper = {
          enabled = true;
          directory = "/home/psoewish/Pictures/wallpapers/misc";
          randomEnabled = true;
          recursiveSearch = true;
          randomIntervalSec = 300;
          setWallpaperOnAllMonitors = true;
          transitionType = "fade";
          transitionDuration = 1500;
        };
      };
    };
  };
}
