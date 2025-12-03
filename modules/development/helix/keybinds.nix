{ username, ... }:
{
  home-manager.users.${username} = {
    programs.helix = {
      settings.keys = {
        normal = {
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
