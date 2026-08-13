{inputs, ...}: {
  imports = [
    (inputs.flake-parts.flakeModules.modules or {})
  ];

  systems = import inputs.systems;
}
