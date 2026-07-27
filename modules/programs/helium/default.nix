{ inputs, ... }: {
  flake-file.inputs.helium.url = "github:oxcl/nix-flake-helium-browser";

  flake.modules.nixos.helium = {
    home-manager.sharedModules = [ inputs.self.modules.homeManager.helium ];
  };

  flake.modules.homeManager.helium = {
    imports = [ (inputs.helium.homeModules.default or { }) ];

    programs.helium = {
      enable = true;
      flags = [ "--show-avatar-button=never" ];
    };
  };
}
