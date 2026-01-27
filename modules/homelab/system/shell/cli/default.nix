{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    bind
    btop
    curl
    eza
    fd
    fzf
    git
    helix
    jq
    ripgrep
    socat
    unzip
    wget
    zip
  ];
}
