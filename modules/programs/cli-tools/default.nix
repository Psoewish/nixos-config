{
  flake.modules.nixos.cli-tools = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      curl
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
  };
  home-manager.sharedModules = [ inputs.self.modules.homeManager.cli-tools ];
}
