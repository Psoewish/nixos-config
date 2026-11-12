{inputs, ...}: {
  den.aspects.shell.tools.nix-alien = {
    nixos = {
      programs.nix-ld.enable = true;
    };

    homeManager = {pkgs, ...}: {
      imports = [inputs.nix-index-database.homeModules.default];
      home.packages = [inputs.nix-alien.packages.${pkgs.stdenv.hostPlatform.system}.nix-alien];
      programs = {
        nix-index.enable = true;
        nix-index-database.comma.enable = true;
      };
    };
  };
}
