{ pkgs, ... }:
{
  programs.fish =
    let
      pluginList =
        plugins:
        map (plugin: {
          name = "${plugin}";
          src = pkgs.fishPlugins."${plugin}".src;
        }) plugins;
    in
    {
      enable = true;
      interactiveShellInit = ''
        set -gx fish_greeting
        set -gx sponge_purge_only_on_exit true
      '';
      shellAbbrs = {
        ff = "fastfetch";
        lg = "lazygit";
        cc = "claude";
      };
      shellAliases = {
        cat = "bat";
        man = "batman";
        shx = "sudo hx";
        mkdir = "mkdir -pv";
        grep = "batgrep --smart-case --color";
        cp = "rsync -ah --info=progress2";
        ls = "eza";
        ll = "eza -l";
        lt = "eza -T -L=3 --git-ignore";
        fzf = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'";
      };
      functions = {
        copycat = "cat $argv | wl-copy";
      };
      plugins = pluginList [
        "autopair"
        "done"
        "puffer"
        "tide"
        "sponge"
        "bass"
        "fzf-fish"
        "fish-bd"
        "bang-bang"
        "plugin-sudope"
      ];
    };
}
