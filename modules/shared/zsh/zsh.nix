{
  username,
  pkgs,
  ...
}:
{
  ### System level config ###
  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "brackets" ];
    };
    autosuggestions = {
      enable = true;
      strategy = [ "completion" ];
    };
  };

  ### User config ###
  home-manager.users.${username} =
    { config, ... }:
    {
      programs.zsh = {
        enable = true;
        autocd = true;
        enableCompletion = true;
        syntaxHighlighting = {
          enable = true;
          highlighters = [ "brackets" ];
        };
        historySubstringSearch.enable = true;
        history = {
          append = true;
          saveNoDups = true;
        };
        autosuggestion = {
          enable = true;
          strategy = [ "completion" ];
        };
        dirHashes = {
          docs = "${config.home.homeDirectory}/Documents";
          dl = "${config.home.homeDirectory}/Downloads";
          pics = "${config.home.homeDirectory}/Pictures";
          vids = "${config.home.homeDirectory}/Videos";
          dots = "${config.home.homeDirectory}/.config";
          sys = "${config.home.homeDirectory}/flakes/nixos-config";
        };
        zsh-abbr = {
          enable = true;
          abbreviations = {
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
          };
        };
        localVariables = {
          ZSH_CLEAN_HISTORY_AUTO_CLEAN = true;
        };
        antidote = {
          enable = true;
          useFriendlyNames = true;
          plugins = [
            "automaat/zsh-clean-history"
            "hlissner/zsh-autopair"
            "toku-sa-n/zsh-dot-up"
          ];
        };
      };
      programs.eza = {
        enable = true;
        git = true;
        icons = "auto";
        colors = "always";
        extraOptions = [
          "--all"
          "--group-directories-first"
        ];
      };
    };
}
