{ username, ... }:
{
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
            set -U fish_greeting
            set -U fish_transient_prompt
            set -U sponge_purge_only_on_exit true
            set -U pure_show_jobs true
            set -U pure_enable_k8s false
            set -U pure_enable_nixdevshell true
            set -U pure_show_prefix_root_prompt true
          '';
          shellAliases = {
            shx = "sudo hx";
            cat = "bat";
            man = "batman";
            mkdir = "mkdir -pv";
            cp = "rsync -ah --info=progress2";
            ls = "eza";
            ll = "eza -l";
            lt = "eza -T -L=3 --git-ignore";
            ff = "fastfetch";
            lg = "lazygit";
            cc = "claude";
            nh-deploy-lab = "nh os switch --target-host psoewish@192.168.1.100 --hostname homelab";
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
            "async-prompt"
            "autopair"
            "done"
            "puffer"
            "pure"
            "sponge"
          ];
        };
    };
}
