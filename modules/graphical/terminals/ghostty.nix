{ username, ... }:
{
  # Run command to enable ghostty terminfo on remote host
  # infocmp -x xterm-ghostty | ssh psoewish@192.168.1.100 -- tic -x -
  home-manager.users.${username} = {
    programs.ghostty = {
      enable = true;
      settings = {
        command = "fish";
        font-family = "CaskaydiaCove Nerd Font";
        font-size = 12;
        theme = "Soft Server";
        clipboard-read = "allow";
        clipboard-write = "allow";
        copy-on-select = true;
        right-click-action = "copy-or-paste";
        confirm-close-surface = false;
        window-inherit-working-directory = false;
        quit-after-last-window-closed = true;
        keybind = "shift+enter=text:\\x1b\\r";
      };
    };
    stylix.targets.ghostty.enable = false;
  };
}
