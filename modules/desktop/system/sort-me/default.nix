{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    bat-extras.batman
    bat-extras.batgrep
    chromium
    eza
    fastfetch
    ghostty
    git
    gh
    lazygit
    helix
    qutebrowser
    ripgrep
    vesktop
    zed
    zoxide
    grimblast
    wl-clipboard
    wl-clip-persist
    cliphist
    hyprcursor
  ];
}
