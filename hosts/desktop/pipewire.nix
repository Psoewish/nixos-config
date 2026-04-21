{ ... }:
{
  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      extraConfig.pipewire = {
        "91-virtual-sinks" = {
          "context.objects" = [
            {
              factory = "adapter";
              args = {
                "factory.name" = "support.null-audio-sink";
                "node.name" = "combine_sink";
                "node.description" = "Master Output";
                "media.class" = "Audio/Sink";
                "audio.position" = "[ FL FR ]";
              };
            }
          ];
          "context.modules" = [
            {
              name = "libpipewire-module-loopback";
              args = {
                "capture.props" = {
                  "node.name" = "game_sink";
                  "node.description" = "Game";
                  "media.class" = "Audio/Sink";
                  "audio.position" = "[ FL FR ]";
                  "node.passive" = true;
                };
                "playback.props" = {
                  "target.object" = "combine_sink";
                  "node.passive" = true;
                };
              };
            }
            {
              name = "libpipewire-module-loopback";
              args = {
                "capture.props" = {
                  "node.name" = "browser_sink";
                  "node.description" = "Browser";
                  "media.class" = "Audio/Sink";
                  "audio.position" = "[ FL FR ]";
                  "node.passive" = true;
                };
                "playback.props" = {
                  "target.object" = "combine_sink";
                  "node.passive" = true;
                };
              };
            }
            {
              name = "libpipewire-module-loopback";
              args = {
                "capture.props" = {
                  "node.name" = "chat_sink";
                  "node.description" = "Chat";
                  "media.class" = "Audio/Sink";
                  "audio.position" = "[ FL FR ]";
                  "node.passive" = true;
                };
                "playback.props" = {
                  "target.object" = "combine_sink";
                  "node.passive" = true;
                };
              };
            }
            {
              name = "libpipewire-module-loopback";
              args = {
                "capture.props" = {
                  "node.name" = "media_sink";
                  "node.description" = "Media";
                  "media.class" = "Audio/Sink";
                  "audio.position" = "[ FL FR ]";
                  "node.passive" = true;
                };
                "playback.props" = {
                  "target.object" = "combine_sink";
                  "node.passive" = true;
                };
              };
            }
          ];
        };
      };
      wireplumber = {
        enable = true;
        extraConfig = {
          pipewire."92-low-latency"."context.properties" = {
            "default.clock" = {
              "rate" = 48000;
              "allowed-rates" = [ 48000 ];
              "quantum" = 800;
              "min-quantum" = 512;
              "max-quantum" = 1024;
            };
          };
          "99-disable-suspend"."monitor.alsa.rules" = [
            {
              matches = [
                { "node.name" = "~alsa_input.*"; }
                { "node.name" = "~alsa_output.*"; }
              ];
              actions.update-props = {
                "session.suspend-timeout-seconds" = 0;
                "node.always-process" = true;
                "dither.method" = "wannamaker3";
                "dither.noise" = 1;
              };
            }
          ];
        };
      };
    };
  };
}
