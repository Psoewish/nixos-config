{ username, ... }:
{
  home-manager.users.${username} = {
    programs.zellij = {
      enable = true;
      extraConfig = /* kdl */ ''
        keybinds {
          normal {
            bind "Ctrl g" {
              Run "lazygit" {
                close_on_exit true
                floating true
                x "10%"
                y "10%"
                width "80%"
                height "80%"
              }
            }
            bind "Ctrl Tab" { GoToNextTab; }
            bind "Ctrl Shift Tab" { GoToPreviousTab; }
            bind "Ctrl q" { Detach; }
            bind "Ctrl Shift q" { Quit; }
          }
        }
      '';
    };

    xdg.configFile."zellij/layouts/dev.kdl".text = /* kdl */ ''
      layout {
        default_tab_template {
          pane size=1 borderless=true {
            plugin location="zellij:compact-bar"
          }
          children
        }
        tab name="dev" focus=true {
          pane split_direction="vertical" {
            pane split_direction="horizontal" {
              pane size="80%" name="editor" focus=true command="hx"
              pane size="20%" name="terminal" command="fish"
            }
            pane size=50 name="claude" command="claude"
          }
        }
        tab name="homelab" {
          pane split_direction="vertical" {
            pane name="terminal" command="ssh" {
              args "psoewish@192.168.1.100"
            }
            pane split_direction="horizontal" {
              pane name="resources" command="ssh" {
                args "psoewish@192.168.1.100" "bash -c top"
              }
              pane name="services" command="ssh" {
                args "psoewish@192.168.1.100"
              }
            }
          }
        }
      }
    '';
  };
}
