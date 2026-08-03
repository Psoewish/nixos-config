{
  flake.modules.nixos.cli-tools = {
    inputs,
    pkgs,
    ...
  }: {
    home-manager.sharedModules = [inputs.self.modules.homeManager.cli-tools];
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
      git
      gh
      lazygit
    ];
  };
}
