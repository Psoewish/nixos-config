{ username, ... }:
{
  home-manager.users.${username} = {
    programs.zellij = {
      enable = true;
      extraConfig = /* kdl */ ''
        default_shell "fish";
        copy_command "wl-copy";
        ui.pane_frames.rounded_corners true;
      '';
      layouts = {
        dev = {
          layout._children = [
            {
              default_tab_template = {
                _children = [
                  {
                    pane = {
                      size = 1;
                      borderless = true;
                      plugin = {
                        location = "zellij:tab-bar";
                      };
                    };
                  }
                  { children = { }; }
                  {
                    pane = {
                      size = 2;
                      borderless = true;
                      plugin = {
                        location = "zellij:status-bar";
                      };
                    };
                  }
                ];
              };
            }

            {
              tab = {
                _props = {
                  name = "dev";
                  focus = true;
                };
                _children = [
                  {
                    pane = {
                      split_direction = "vertical";
                      _children = [
                        {
                          pane = {
                            size = 50;
                            split_direction = "horizontal";
                            _children = [
                              {
                                pane = {
                                  size = "50%";
                                  name = "file-tree";
                                  plugin = {
                                    location = "zellij:strider";
                                  };
                                };
                              }
                              {
                                pane = {
                                  size = "50%";
                                  name = "git";
                                  command = "fish";
                                };
                              }
                            ];
                          };
                        }

                        {
                          pane = {
                            split_direction = "vertical";
                            _children = [
                              {
                                pane = {
                                  size = "100%";
                                  split_direction = "horizontal";
                                  _children = [
                                    {
                                      pane = {
                                        size = "80%";
                                        name = "editor";
                                        command = "hx";
                                      };
                                    }
                                    {
                                      pane = {
                                        size = "20%";
                                        name = "terminal";
                                        command = "fish";
                                      };
                                    }
                                  ];
                                };
                              }
                            ];
                          };
                        }
                        {
                          pane = {
                            size = 50;
                            name = "claude";
                            command = "claude";
                          };
                        }
                      ];
                    };
                  }
                ];
              };
            }
          ];

          floating_panes = {
            _children = [
              {
                pane = {
                  name = "lazygit";
                  x = "10%";
                  y = "10%";
                  width = "80%";
                  height = "80%";
                  command = "lazygit";
                };
              }
            ];
          };
        };
      };
    };
  };
}
