{
  den,
  inputs,
  ...
}: {
  # Easy debugging :)
  flake.den = den;
  flake.home = inputs.self.nixosConfigurations.nausicaa.config.home-manager.users.psoewish;

  imports = [
    inputs.den.flakeModule
    (inputs.import-tree [
      ./machines
      ./aspects
    ])
  ];

  den = {
    schema.user.classes = ["homeManager"];
    default = {
      nixos.system.stateVersion = "26.11";
      homeManager.home.stateVersion = "26.11";
      includes = with den._; [
        hostname
        inputs'
        self'
        define-user
        host-aspects
        user-aspects
      ];
    };
  };
}
