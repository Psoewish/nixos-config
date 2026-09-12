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
      eza
      stow
      fastfetch
      wl-clipboard-rs
      wl-clip-persist
      yadm
    ];
  };
}
