{ inputs, ... }:
let
  inherit (inputs) self;
  inherit (inputs.nixpkgs.lib)
    extend
    mapAttrs'
    nameValuePair
    removeSuffix
    filterAttrs
    hasSuffix
    ;
  inherit (builtins) readDir;
in
extend (
  self': _: {
    fractal =
      mapAttrs'
        (
          name: _:
          nameValuePair (removeSuffix ".nix" name) (
            import ./${name} {
              inherit inputs self;
              lib = self';
            }
          )
        )
        (
          filterAttrs (name: type: type == "regular" && hasSuffix ".nix" name && name != "default.nix") (
            readDir ./.
          )
        );
  }
)
