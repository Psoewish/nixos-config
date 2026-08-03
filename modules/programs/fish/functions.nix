{
  flake.modules.homeManager.fish = {pkgs, ...}: {
    programs.fish.functions = {
      copycat = "cat $argv | ${pkgs.wl-clipboard-rs}/bin/wl-copy";
    };
  };
}
