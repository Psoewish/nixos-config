{
  pkgs,
  username,
  ...
}:
{
  home-manager.users.${username} = {
    programs.tmux = {
      enable = true;
      mouse = true;
      terminal = "tmux-256-color";
      shortcut = "a";
      shell = "${pkgs.fish}/bin/fish";
      historyLimit = 5000;
      focusEvents = true;
      baseIndex = 1;
      tmuxp.enable = true;
    };
  };
}
