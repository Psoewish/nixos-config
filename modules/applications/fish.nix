toplevel @ {...}: {
  flake.modules.nixos.fish = {pkgs, ...}: {
    home-manager.sharedModules = [toplevel.inputs.self.modules.homeManager.fish];
    programs.fish = {
      enable = true;
      useBabelfish = true;
    };
    environment.systemPackages = with pkgs.fishPlugins; [
      autopair
      done
      puffer
      sponge
      plugin-sudope
      pure
      z
      colored-man-pages
    ];
  };

  flake.modules.homeManager.fish = {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -gx fish_greeting
        set -gx sponge_purge_only_on_exit true
        set -gx EDITOR hx
        set -gx VISUAL hx

        set -gx pure_show_numbered_git_indicator true
        set -gx pure_enable_nixdevshell true
        set -gx fish_transient_prompt 1
        set -gx pure_show_prefix_root_prompt true
        set -gx async_prompt_functions _pure_prompt_git
      '';

      shellAbbrs = {
        ff = "fastfetch";
        lg = "lazygit";
      };

      shellAliases = {
        eza = "eza --icons always --color always --git --group-directories-first";
        ls = "eza";
        la = "eza --all";
        ll = "eza --long --all";
        lt = "eza --level 3 --git-ignore";

        cat = "bat --style=plain --paging=never --italic-text=always --theme=ansi";
        cp = "rsync -ah --info=progress2";
        mkdir = "mkdir -pv";
      };

      functions = {
        copycat = "cat $argv | wl-copy";

        pw-util = ''
          # set up possible flags
          argparse --strict-longopts i/init s/switch h/help -- $argv

          # general vars
          set -f speakers "alsa_output.pci-0000_03_00.1.hdmi-stereo"
          set -f headphones "alsa_output.usb-Logitech_PRO_X_2_LIGHTSPEED_0000000000000000-00.analog-stereo"
          set -f statefile "$HOME/.local/state/audio-state"

          # make sure an audio state is initialized
          if not test -e $statefile
              echo $speakers >$statefile
          end

          # set last known audio state as current device, set inactive device as new device
          set -f current_device (cat $statefile)
          if test $current_device = $speakers
              set -f new_device $headphones
          else
              set -f new_device $speakers
          end

          # (re)Initialize device (useful after links get destroyed by e.g. monitor going off)
          if set -q _flag_init
              _link_devices $current_device
              echo "Links established, happy listening :)"
          end

          # Switch output device between monitor speakers and headphones
          if set -q _flag_switch
              _unlink_devices $current_device
              _link_devices $new_device
              echo $new_device >$statefile
              echo "Output device switched!"
          end

          # self-reminder of possible flags :)
          if set -q _flag_help || not set -q _flag_init && not set -q _flag_switch
              echo "pw-util - PipeWire output routing"

              echo "Usage:"
              echo "    pw-util --init       Re-establish links for the last known output"
              echo "    pw-util --switch     Switch between speakers and headphones"
              echo "    pw-util --help       Show this help"
              echo ""

              echo "The current output is persisted in:"
              echo "    $statefile"
          end
        '';

        _link_devices = ''
          pw-link "combine_sink:monitor_FR" "$argv:playback_FR"
          pw-link "combine_sink:monitor_FL" "$argv:playback_FL"
        '';

        _unlink_devices = ''
          pw-link -d "combine_sink:monitor_FR" "$argv:playback_FR"
          pw-link -d "combine_sink:monitor_FL" "$argv:playback_FL"
        '';
      };
    };
  };
}
