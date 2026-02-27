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
