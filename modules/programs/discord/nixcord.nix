{ inputs, ... }: {
  flake-file.inputs.nixcord.url = "github:4evy/nixcord";

  flake.modules.nixos.discord = {
    home-manager.sharedModules = [ inputs.self.modules.homeManager.discord ];
  };

  flake.modules.homeManager.discord = {
    imports = [ (inputs.nixcord.homeModules.nixcord or { }) ];

    programs.nixcord = {
      enable = true;
      vesktop.enable = true;
      config.autoUpdate = true;
    };
  };
}
