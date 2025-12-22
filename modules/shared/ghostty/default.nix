{ username, ... }:
{
  home-manager.users.${username} = {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = "Rose Pine";
        font-family = "CaskaydiaCove Nerd Font";
        font-size = 12;
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
  };
}
