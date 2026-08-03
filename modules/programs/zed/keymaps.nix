{
  flake.modules.homeManager.zed = {
    programs.zed-editor.userKeymaps = [
      {
        bindings = {
          ctrl-t = "terminal_panel::Toggle";
          ctrl-shift-t = "workspace::NewTerminal";
        };
      }
    ];
  };
}
