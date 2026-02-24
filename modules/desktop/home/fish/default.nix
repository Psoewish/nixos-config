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
      };
      shellAliases = {
        cat = "bat";
        man = "batman";
        shx = "sudo hx";
        mkdir = "mkdir -pv";
        grep = "ripgrep --smart-case --hidden";
        cp = "rsync -ah --info=progress2";
        ls = "eza --all --group-directories-first --git --color=always --icons=always";
        ll = "eza -l --all --group-directories-first --git --color=always --icons=always";
        lt = "eza --tree --level 3 --git-ignore";
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
        "fzf-fish"
        "plugin-sudope"
      ];
    };
}
