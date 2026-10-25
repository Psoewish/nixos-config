{
  pkgs,
  lib,
  ...
}: {
  programs.fish = {
    enable = true;
    useBabelfish = true;
  };

  environment.systemPackages =
    (with pkgs.fishPlugins; [
      autopair
      done
      puffer
      sponge
      plugin-sudope
      pure
      colored-man-pages
    ])
    ++ (with pkgs; [
      btop
      curl
      fd
      fzf
      jq
      ripgrep
      killall
      socat
      wget
      unzip
      unrar
      zip
      bind
      bat
      eza
      wl-clipboard-rs
      wl-clip-persist
    ]);

  hm.programs.fish = {
    enable = true;
    interactiveShellInit = lib.concatLines (lib.map (p: "set -gx " + p) [
      "fish_greeting"
      "sponge_purge_only_on_exit true"
      "EDITOR hx"
      "VISUAL hx"
      "pure_show_numbered_git_indicator true"
      "pure_enable_nixdevshell true"
      "fish_transient_prompt 1"
      "pure_show_prefix_root_prompt true"
      "async_prompt_functions _pure_prompt_git"
    ]);
    shellAbbrs = {
      ff = "fastfetch";
      lg = "lazygit";
    };
    shellAliases = {
      eza = "eza --icons always --color always --git --group-directories-first";
      ls = "eza";
      la = "eza --all";
      ll = "eza --long --all";
      lt = "eza --tree --level 3 --git-ignore";

      cat = "bat --style=plain --paging=never --italic-text=always";
      cp = "rsync -ah --info=progress2";
      mkdir = "mkdir -pv";
    };
    functions = {
      copycat = "cat $argv | wl-copy";
    };
  };
}
