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
            set -gx tide_prompt_transient_enabled true
            set -gx tide_left_prompt_items pwd git newline character
            set -gx tide_right_prompt_items status cmd_duration context jobs direnv nix_shell go python rustc
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
            k = /* fish */ ''
              set -l session_dir "~/.config/kitty/sessions"
              set -l session_name $argv[1]

              # Default session
              if test -z "$session_name"
                set session_name "dev"
                set workdir "~/flakes/nixos-config"
              end

              kitty --working-directory $workdir --session "$session_dir/$session_name.kitty-session" --detach &
              exit
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
