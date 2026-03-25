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
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        prettybat
      ];
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
    vivid.enable = true;
  };
}
