{
  pkgs,
  username,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    bat
    bat-extras.batdiff
    bat-extras.batman
    bat-extras.prettybat
    curl
    eza
    btop
    fd
    fzf
    jq
    ripgrep
    killall
    socat
    wget
    unzip
    zip
    bind
  ];
  home-manager.users.${username} = {
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
