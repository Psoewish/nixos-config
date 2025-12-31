{ username, ... }:
{
  fractal.tags = [ "desktop" ];
  home-manager.users.${username} =
    {
      inputs,
      pkgs,
      ...
    }:
    {
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
