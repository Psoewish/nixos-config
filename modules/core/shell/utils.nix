{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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
  programs = {
    bat = {
      enable = true;
      extraPackages = [ pkgs.bat-extras.batman ];
      settings = {
        italic-text = "always";
        paging = "never";
        style = "plain";
      };
    };
    zoxide = {
      enable = true;
      flags = [ "--cmd cd" ];
    };
  };
  hm.programs.eza = {
    enable = true;
    colors = "always";
    icons = "always";
    git = true;
    extraOptions = [
      "--all"
      "--group-directories-first"
    ];
  };
}
