{
  username,
  inputs,
  pkgs,
  ...
}:
{
  home-manager.users.${username} = {
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
