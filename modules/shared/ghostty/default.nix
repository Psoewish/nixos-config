{ username, pkgs, ... }:
{
  home-manager.users.${username} = {
    programs.ghostty = {
      enable = true;
      package = pkgs.unstable.ghostty;
      settings = {
        theme = "Rose Pine";
        font-family = "SauceCodePro Nerd Font Propo";
        font-size = 12;
        unfocused-split-opacity = 1;
        clipboard-read = "allow";
        clipboard-write = "allow";
        copy-on-select = true;
        right-click-action = "copy-or-paste";
        confirm-close-surface = false;
        window-inherit-working-directory = false;
        quit-after-last-window-closed = true;
        keybind = [
          # Shift+enter newline
          "shift+enter=text:\\x1b\\r"
          # Tab keybinds
          "ctrl+t=new_tab"
          "ctrl+tab=next_tab"
          "ctrl+shift+tab=previous_tab"
          "ctrl+w=close_tab:this"
          # Split keybinds
          "alt+enter=new_split:down"
          "alt+shift+enter=new_split:right"
          "alt+left=goto_split:left"
          "alt+down=goto_split:down"
          "alt+up=goto_split:up"
          "alt+right=goto_split:right"
          "alt+w=close_surface"
          "alt+ctrl+left=resize_split:left,50"
          "alt+ctrl+down=resize_split:down,50"
          "alt+ctrl+up=resize_split:up,50"
          "alt+ctrl+right=resize_split:right,50"
        ];
      };
    };
  };
}
