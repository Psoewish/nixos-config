{
  flake.modules.nixos.cli-tools = {pkgs, ...}: {
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
      zip
      bind
      bat
      bat-extras.batman
      eza
      zoxide
      stow
      fastfetch
      wl-clipboard-rs
      wl-clip-persist
    ];
  };
}
