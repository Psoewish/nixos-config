{ username, ... }:
{
  home-manager.users.${username} = {
    programs.zellij = {
      enable = true;
      layouts = {
        dev = {
          layout._children = [
            {
              default_tab_template = {
                _children = [
                  # Tab bar at top
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
                        # Left column: file tree + git
                        {
                          pane = {
                            size = 35;
                            split_direction = "horizontal";
                            _children = [
                              {
                                pane = {
                                  size = "50%";
                                  name = "file-tree";
                                  command = "fish";
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

                        # Center area: editor + terminal
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

                        # Right column: Claude
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
                  name = "floating-terminal";
                  x = "10%";
                  y = "10%";
                  width = "80%";
                  height = "80%";
                };
              }
            ];
          };
        };
      };
    };
  };
}
