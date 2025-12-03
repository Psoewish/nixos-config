{ username, ... }:
{
  home-manager.users.${username} =
    { osConfig, ... }:
    {
      programs.helix = {
        languages = {
          language = [
            {
              name = "nix";
              auto-format = true;
            }
            {
              name = "lua";
              auto-format = true;
            }
            {
              name = "markdown";
              language-servers = [
                "marksman"
                "markdown-oxide"
                "harper-ls"
                "mpls"
              ];
              formatter = {
                command = "prettier";
                args = [
                  "--parser"
                  "--markdown"
                  "--prose-wrap"
                  "never"
                ];
              };
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
          language-server.harper-ls = {
            command = "harper-ls";
            args = [ "--stdio" ];
          };
          language-server.mpls = {
            command = "mpls";
            args = [
              "--dark-mode"
              "--enable-emoji"
              "--full-sync"
            ];
          };
        };
      };
    };
}
