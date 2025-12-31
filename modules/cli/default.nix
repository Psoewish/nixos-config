{
  pkgs,
  username,
  ...
}:
{
  fractal.tags = [ "core" ];
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
    highlight
    zoxide
    delta
  ];
  home-manager.users.${username} =
    { pkgs, ... }:
    {
      programs = {
        eza = {
          enable = true;
          git = true;
          icons = "auto";
          colors = "always";
          extraOptions = [
            "--all"
            "--group-directories-first"
          ];
        };
        zoxide = {
          enable = true;
          options = [ "--cmd cd" ];
        };
        bat = {
          enable = true;
          extraPackages = with pkgs.bat-extras; [
            batman
            batgrep
          ];
        };
        ripgrep = {
          enable = true;
          arguments = [
            "--hidden"
            "--smart-case"
          ];
        };
        delta = {
          enable = true;
          enableGitIntegration = true;
          enableJujutsuIntegration = true;
        };
      };
    };
}
