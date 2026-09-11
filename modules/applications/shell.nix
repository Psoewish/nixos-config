{
  flake.modules.nixos.shell = {
    programs.starship.enable = true;

    programs.fish = {
      enable = true;
      useBabelfish = true;
    };

    programs.zsh = {
      enable = true;
      shellInit = ''export ZDOTDIR="$HOME/.config/zsh"'';
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}
