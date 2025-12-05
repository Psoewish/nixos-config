{ username, ... }:
{
  # System Config
  programs.fish.enable = true;

  # Home Config
  home-manager.users.${username} =
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
            "--help" = {
              position = "anywhere";
              expansion = "--help | bat -plhelp";
            };
            "-h" = {
              position = "anywhere";
              expansion = "-h | bat -plhelp";
            };
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
            nh-deploy-lab = "nh os switch --target-host psoewish@192.168.1.100 --hostname homelab";
            fzf = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'";
          };
          functions = {
            copycat = "cat $argv | wl-copy";
            zdev = /* fish */ ''
              set -l session_name $argv[1]
              set -l layout $argv[2]
              if test -z "$session_name"
                set session_name (basename $PWD)
              end
              if test -z "$layout"
                set layout "dev"
              end
              zellij --layout "$layout" attach -c "$session_name"
            '';
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
    };
}
