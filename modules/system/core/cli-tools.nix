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

  flake.modules.homeManager.core = {pkgs, ...}: {
    programs = {
      bat = {
        enable = true;
        extraPackages = [pkgs.bat-extras.batman];
        config = {
          italic-text = "always";
          paging = "never";
          style = "plain";
        };
      };
      eza = {
        enable = true;
        colors = "always";
        icons = "always";
        git = true;
        extraOptions = [
          "--all"
          "--group-directories-first"
        ];
      };
      zoxide = {
        enable = true;
        options = ["--cmd cd"];
      };
      vivid = {
        enable = true;
      };
    };
  };
}
