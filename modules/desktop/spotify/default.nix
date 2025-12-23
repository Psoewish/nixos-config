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
          theme = spicePkgs.themes.comfy;
          colorScheme = "rose-pine";
          enabledExtensions = with spicePkgs.extensions; [
            autoSkipVideo
            hidePodcasts
          ];
        };
    };
}
