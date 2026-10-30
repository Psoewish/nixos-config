{
  pkgs,
  lib,
  ...
}: {
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
    colored-man-pages
    fzf-fish
  ];

  home.config = {
    programs.fish = {
      enable = true;
      interactiveShellInit = lib.concatLines (map (p: "set -gx " + p) [
        "fish_greeting"
        "sponge_purge_only_on_exit true"
        "EDITOR hx"
        "VISUAL hx"
        "pure_show_numbered_git_indicator true"
        "pure_enable_nixdevshell true"
        "fish_transient_prompt 1"
        "pure_show_prefix_root_prompt true"
        "async_prompt_functions _pure_prompt_git"
        "fzf_preview_dir_cmd eza --all --color=always"
        "fzf_diff_highlighter delta --paging=never --width=20"
      ]);
      shellInitLast = ''
        batman --export-env | source
      '';
      shellAbbrs = {
        ff = "fastfetch";
        lg = "lazygit";
      };
      shellAliases = {
        ls = "eza";
        la = "eza --all";
        ll = "eza --long --all";
        lt = "eza --tree --level 3 --git-ignore";

        cat = "bat";
        cp = "rsync -ah --info=progress2";
        mkdir = "mkdir -pv";
        findcat = "fd $argv -X bat";
        copycat = "cat $argv | wl-copy";
        grepcat = "batgrep $argv --paging=never";
      };
    };
  };
}
