{ username, ... }:
{
  home-manager.users.${username} = {
    programs.helix = {
      settings.keys = {
        normal = {
          n = [ "move_char_left" ];
          e = [ "move_line_down" ];
          i = [ "move_line_up" ];
          o = [ "move_char_right" ];

          h = [ "insert_mode" ];
          H = [ "insert_at_line_start" ];

          l = [ "open_below" ];
          L = [ "open_above" ];

          k = [ "move_next_word_end" ];
          K = [ "move_next_long_word_end" ];

          j = [ "search_next" ];
          J = [ "search_prev" ];

          E = [ "join_selections" ];
          A-E = [ "join_selections_space" ];

          I = [ "keep_selections" ];
          A-I = [ "remove_selections" ];

          z = {
            e = [ "scroll_down" ];
            i = [ "scroll_up" ];
          };

          Z = {
            e = [ "scroll_down" ];
            i = [ "scroll_up" ];
          };

          space.w = {
            n = [ "jump_view_left" ];
            e = [ "jump_view_down" ];
            i = [ "jump_view_up" ];
            o = [ "jump_view_right" ];
          };

          C-w = {
            n = [ "jump_view_left" ];
            e = [ "jump_view_down" ];
            i = [ "jump_view_up" ];
            o = [ "jump_view_right" ];
          };

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

        select = {
          n = [ "move_char_left" ];
          e = [ "move_line_down" ];
          i = [ "move_line_up" ];
          o = [ "move_char_right" ];

          h = [ "insert_mode" ];
          H = [ "insert_at_line_start" ];

          l = [ "open_below" ];
          L = [ "open_above" ];

          k = [ "move_next_word_end" ];
          K = [ "move_next_long_word_end" ];

          j = [ "search_next" ];
          J = [ "search_prev" ];

          E = [ "join_selections" ];
          A-E = [ "join_selections_space" ];

          I = [ "keep_selections" ];
          A-I = [ "remove_selections" ];
        };
      };
    };
  };
}
