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
    zoxide
  ];
}
