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
