{
  flake-file.inputs.nixcord = {
    url = "github:4evy/nixcord";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.discord = {inputs, ...}: {
    home-manager.sharedModules = [inputs.self.modules.homeManager.discord];
  };

  flake.modules.homeManager.discord = {inputs, ...}: {
    imports = [(inputs.nixcord.homeModules.nixcord or {})];

    programs.nixcord = {
      enable = true;
      vesktop.enable = true;
      discord.vencord.enable = true;
      config.autoUpdate = true;
    };
  };
}
