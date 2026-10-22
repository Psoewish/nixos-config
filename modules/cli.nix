{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
  ];
}
