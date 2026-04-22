{ username, pkgs, ... }:
let
  stateFile = "/home/${username}/.audio-device-state";
  speakers = "alsa_output.pci-0000_03_00.1.hdmi-stereo";
  headphones = "alsa_output.usb-Logitech_PRO_X_2_LIGHTSPEED_0000000000000000-00.analog-stereo";
in
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

  systemd.user = {
    tmpfiles.rules = [ "f ${stateFile} - - - - ${speakers}" ];
    services =
      let
        routingScript = /* bash */ ''
          DEVICE=$(cat ${stateFile})

          # Wait to run the script until the last known device becomes available
          while ! ${pkgs.pipewire}/bin/pw-link -o 2>/dev/null | grep -q "$DEVICE"; do
            sleep 0.2
          done

          echo "Device $DEVICE found, establishing links..."
          ${pkgs.pipewire}/bin/pw-link "combine_sink:monitor_FR" "$DEVICE:playback_FR" 
          ${pkgs.pipewire}/bin/pw-link "combine_sink:monitor_FL" "$DEVICE:playback_FL"
          echo "Links established, happy listening :)"
        '';
      in
      {
        pipewire-routing-init = {
          unitConfig = {
            Description = "Pipewire audio routing initialization";
            After = [ "graphical-session.target" ];
            Wants = [ "graphical-session.target" ];
          };
          serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
            Restart = "on-failure";
            RestartSec = 2;
          };
          wantedBy = [ "default.target" ];
          script = routingScript;
        };
        pipewire-routing-on-resume = {
          unitConfig.Description = "Restore Pipewire routing after sleep";
          serviceConfig.Type = "oneshot";
          wantedBy = [ "sleep.target" ];
          script = routingScript;
        };
      };
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "pipewire-routing-toggle" /* bash */ ''
      CURRENT_DEVICE=$(cat ${stateFile})

      if [[ $CURRENT_DEVICE == "${speakers}" ]]; then
        DEVICE=${headphones}
      else
        DEVICE=${speakers}
      fi

      ${pkgs.pipewire}/bin/pw-link -d "combine_sink:monitor_FR" "${speakers}:playback_FR"
      ${pkgs.pipewire}/bin/pw-link -d "combine_sink:monitor_FL" "${speakers}:playback_FL"
      ${pkgs.pipewire}/bin/pw-link -d "combine_sink:monitor_FR" "${headphones}:playback_FR"
      ${pkgs.pipewire}/bin/pw-link -d "combine_sink:monitor_FL" "${headphones}:playback_FL"

      ${pkgs.pipewire}/bin/pw-link "combine_sink:monitor_FR" "$DEVICE:playback_FR"
      ${pkgs.pipewire}/bin/pw-link "combine_sink:monitor_FL" "$DEVICE:playback_FL"

      echo "$DEVICE" > ${stateFile}
    '')
    pkgs.pulsemixer
  ];
}
