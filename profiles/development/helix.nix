{ username, ... }:
{
  home-manager.users.${username} =
    { osConfig, ... }:
    {
      programs.helix = {
        enable = true;
        defaultEditor = true;
        settings = {
          editor = {
            line-number = "absolute";
            continue-comments = false;
            bufferline = "multiple";
            color-modes = true;
            end-of-line-diagnostics = "hint";
          };
          editor.statusline = {
            left = [
              "mode"
              "read-only-indicator"
              "diagnostics"
            ];
            center = [
              "spinner"
              "file-name"
              "file-modification-indicator"
            ];
            right = [
              "file-type"
              "position"
            ];
          };
          editor.cursor-shape = {
            insert = "bar";
          };
          editor.file-picker = {
            hidden = false;
          };
          editor.whitespace.render = {
            space = "none";
            tab = "all";
            nbsp = "none";
            nnbsp = "none";
            newline = "none";
          };
          editor.indent-guides = {
            render = true;
            character = "▏";
            skip-levels = 1;
          };
          editor.soft-wrap = {
            enable = true;
          };
          editor.inline-diagnostics = {
            cursor-line = "warning";
          };
          keys.normal = {
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
        languages = {
          language = [
            {
              name = "nix";
              auto-format = true;
            }
          ];
          language-server.nixd = {
            command = "nixd";
            config.nixd =
              let
                myFlake = ''(builtins.getFlake "${osConfig.programs.nh.flake}")'';
                nixosOpts = "${myFlake}.nixosConfigurations.${osConfig.networking.hostName}.options";
              in
              {
                formatting.command = [ "nixfmt" ];
                nixpkgs.expr = "import ${myFlake}.inputs.nixpkgs { }";
                options.home-manager.expr = nixosOpts;
                options.nixos.expr = "${nixosOpts}.home-manager.users.type.getSubOptions []";
              };
          };
        };
      };
    };
}
