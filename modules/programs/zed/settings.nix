{
  flake.modules.homeManager.zed = {
    programs.zed-editor.userSettings = {
      lsp_document_colors = "background";
      disable_ai = false;
      telemetry = {
        metrics = false;
      };
      terminal = {
        shell.program = "fish";
      };
      helix_mode = true;
      languages = {
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
          formatter.external.command = "alejandra";
        };
      };
    };
  };
}
