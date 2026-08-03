{
  flake-file.inputs = {
    streamcontroller.url = "github:daaboulex/streamcontroller-nix";
    streamcontroller.inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.streamcontroller = {inputs, ...}: {
    imports = [inputs.streamcontroller.nixosModules.default];
    nixpkgs.overlays = [inputs.streamcontroller.overlays.default];
    home-manager.sharedModules = with inputs; [
      streamcontroller.homeManagerModules.default
      self.modules.homeManager.streamcontroller
    ];

    programs.streamcontroller = {
      enable = true;
      autostart = true;
    };
  };

  flake.modules.homeManager.streamcontroller = {};
  # hm.programs.streamcontroller = let
  #   assetDir = "${config.programs.streamcontroller.dataPath}/assets";
  # in {
  #   enable = true;
  #   assets = {
  #     gamepad = ./assets/gamepad.jpg;
  #     browser = ./assets/browser.jpg;
  #     chat = ./assets/chat.jpg;
  #     music = ./assets/music.jpg;
  #     blank-background = ./assets/blank_background.jpg;
  #     audio-output = ./assets/audio-output.jpg;
  #     prev-track = ./assets/prev-track.jpg;
  #     play-pause = ./assets/play-pause.jpg.jpg;
  #     next-track = ./assets/next-track.jpg;
  #   };

  #   defaultPages."5A42712KZLX" = "Default";

  #   pages = {
  #     Default = {
  #       brightness.value = 100;

  #       extraConfig = {
  #         background.overwrite = false;
  #         dials = {
  #           "0".states."0" = {
  #             actions = [
  #               {
  #                 id = "com_gapls_AudioControl::AdjustVolume";
  #                 settings = {
  #                   info-content = "volume";
  #                   pulse-name = "game_sink";
  #                   show-device-name = false;
  #                   show-info = true;
  #                   volume-adjust = 5.0;
  #                 };
  #               }
  #             ];
  #             media.path = "assets.gamepad_icon";
  #           };
  #           "1".states."0" = {
  #             actions = [
  #               {
  #                 id = "com_gapls_AudioControl::AdjustVolume";
  #                 settings = {
  #                   pulse-name = "browser_sink";
  #                   show-device-name = false;
  #                   volume-adjust = 5.0;
  #                 };
  #               }
  #             ];
  #             media.path = "${assetDir}/browser.jpg";
  #           };
  #           "2".states."0" = {
  #             actions = [
  #               {
  #                 id = "com_gapls_AudioControl::AdjustVolume";
  #                 settings = {
  #                   pulse-name = "chat_sink";
  #                   show-device-name = false;
  #                   volume-adjust = 5.0;
  #                 };
  #               }
  #             ];
  #             media.path = assets.chat_icon;
  #           };
  #           "3".states."0" = {
  #             actions = [
  #               {
  #                 id = "com_gapls_AudioControl::AdjustVolume";
  #                 settings = {
  #                   device-filter = "sink";
  #                   info-content = "volume";
  #                   pulse-name = "media_sink";
  #                   show-device-name = false;
  #                   show-info = true;
  #                   use-standard = false;
  #                   volume-adjust = 5.0;
  #                 };
  #               }
  #             ];
  #             media.path = assets.music_icon;
  #           };
  #         };
  #         touchscreens."sd-plus".states."0".background.image = assets.blank_icon;
  #       };
  #       keys = {
  #         "0x1".states."0" = {
  #           media.path = assets.swap-audio_icon;
  #           actions = [
  #             {
  #               id = "com_core447_OSPlugin::RunCommand";
  #               settings = {
  #                 command = "pipewire-routing-toggle";
  #                 detached = true;
  #                 display_output = false;
  #               };
  #             }
  #           ];
  #         };
  #         "1x1".states."0" = {
  #           media.path = assets.media-next_icon;
  #           actions = [
  #             {
  #               id = "com_core447_MediaPlugin::Previous";
  #               settings = {
  #                 player_name = "com.github.th-ch.youtube-music";
  #                 show_label = false;
  #                 show_thumbnail = false;
  #               };
  #             }
  #           ];
  #         };
  #         "2x1".states."0" = {
  #           media.path = assets.media-play-pause_icon;
  #           actions = [
  #             {
  #               id = "com_core447_MediaPlugin::PlayPause";
  #               settings = {
  #                 player_name = "com.github.th-ch.youtube-music";
  #                 show_label = false;
  #                 show_thumbnail = true;
  #               };
  #             }
  #           ];
  #         };
  #         "3x1".states."0" = {
  #           media.path = assets.media-next_icon;
  #           actions = [
  #             {
  #               id = "com_core447_MediaPlugin::Next";
  #               settings = {
  #                 player_name = "com.github.th-ch.youtube-music";
  #                 show_label = false;
  #                 show_thumbnail = false;
  #               };
  #             }
  #           ];
  #         };
  #       };
  #     };
  #   };
  # };
}
