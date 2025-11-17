{ username, ... }:
{
  home-manager.users.${username} =
    {
      inputs,
      pkgs,
      ...
    }:
    {
      imports = [ inputs.spicetify-nix.homeManagerModules.default ];
      programs.spicetify =
        let
          spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
        in
        {
          enable = true;
          windowManagerPatch = true;
          wayland = true;
          enabledExtensions = with spicePkgs.extensions; [
            autoSkipVideo
            hidePodcasts
          ];
        };
    };
}
