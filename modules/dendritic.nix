{ inputs, ... }: {
  flake-file.inputs = {
    flake-file.url = "github:denful/flake-file";
    systems.url = "github:nix-systems/default";
  };

  imports = [ (inputs.flake-file.flakeModules.dendritic or { }) ];

  systems = import inputs.systems;
}
