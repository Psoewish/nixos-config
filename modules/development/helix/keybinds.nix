{ username, ... }:
{
  home-manager.users.${username} = {
    programs.helix = {
      settings.keys = {
        normal = {
          esc = [
            "collapse_selection"
            "keep_primary_selection"
          ];
          C-g = [
            ":new"
            ":insert-output lazygit"
            ":buffer-close!"
            ":redraw"
          ];
          C-s = [ ":w" ];
        };
      };
    };
  };
}
