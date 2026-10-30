{
  inputs,
  pkgs,
  ...
}: {
  imports = with inputs; [mangowm.nixosModules.mango];
  services.getty.autologinUser = "psoewish";
  programs.fish.loginShellInit = "test (tty) = /dev/tty1; and exec mango";

  programs.mango.enable = true;
  services.gnome.gnome-keyring.enable = true;

  home.config = {
    imports = [inputs.mangowm.hmModules.mango];
    wayland.windowManager.mango.enable = true;
  };

  environment.systemPackages = [
    (pkgs.writers.writeFishBin "screenshot" ''
      argparse --strict-longopts r/region w/window o/output_focused O/output_all 'a/annotate&' -- $argv
      or exit

      set -f tmpfile (mktemp --suffix=.png)
      set -f screenshotdir "$HOME/Pictures/Screenshots"
      mkdir -p $screenshotdir
      set -f filepath "$screenshotdir/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

      switch $argv_opts
          case $_flag_region
              wayfreeze --after-freeze-timeout 100 --after-freeze-cmd 'grim -g "$(slurp -d)" '$tmpfile'; killall wayfreeze'
          case $_flag_window
              grim -g "$(mmsg get focusing-client | jq --raw-output '"\(.x),\(.y) \(.width)x\(.height)"')" $tmpfile
          case $_flag_output_focused
              grim -o "$(mmsg get all-monitors | jq --raw-output '.monitors[] | select (.active) | .name')" $tmpfile
          case $_flag_output_all
              grim $tmpfile
      end
      test -s $tmpfile; or begin; rm -f $tmpfile; exit; end

      if set -q _flag_annotate
          satty --filename $tmpfile --output-filename $filepath
      else
          wl-copy <$tmpfile
          cp $tmpfile $filepath
      end

      rm -f $tmpfile
    '')
  ];
}
