{
  username,
  ...
}:
{
  home-manager.users.${username} = {
    programs.ghostty = {
      enable = true;
      settings = {
        command = "fish";
        clipboard-read = "allow";
        clipboard-write = "allow";
        copy-on-select = true;
        right-click-action = "copy-or-paste";
        confirm-close-surface = false;
        window-inherit-working-directory = false;
        quit-after-last-window-closed = true;
      };
    };
  };
}
