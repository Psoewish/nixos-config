{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) getExe;
in {
  programs.fish = {
    enable = true;
    useBabelfish = true;
  };

  hm.programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx fish_greeting
      set -gx sponge_purge_only_on_exit true
    '';
    shellAbbrs = with pkgs; {
      ff = "${getExe fastfetch}";
      lg = "${getExe lazygit}";
    };
    shellAliases = with pkgs; {
      cat = "${getExe bat}";
      man = "${getExe bat-extras.batman}";
      shx = "sudo ${getExe pkgs.helix}";
      mkdir = "mkdir -pv";
      cp = "${getExe rsync} -ah --info=progress2";
      ls = "${getExe eza} --all";
      ll = "${getExe eza} --long --all";
      lt = "${getExe eza} --tree --level 3 --git-ignore";
    };
    functions = with pkgs; {
      copycat = "cat $argv | ${wl-clipboard-rs}/bin/wl-copy";
    };
    plugins =
      map
      (plugin: {
        name = plugin;
        src = pkgs.fishPlugins.${plugin}.src;
      })
      [
        "autopair"
        "done"
        "puffer"
        "tide"
        "sponge"
        "plugin-sudope"
      ];
  };
}
