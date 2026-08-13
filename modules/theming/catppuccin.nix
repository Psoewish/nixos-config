{
  flake.modules.nixos.catppuccin = {inputs, ...}: {
    imports = with inputs; [
      (catppuccin.nixosModules.catppuccin or {})
      self.modules.nixos.theme-base
    ];
    home-manager.sharedModules = with inputs.self.modules; [
      homeManager.theme-base
      homeManager.catppuccin
    ];
    catppuccin = {
      autoEnable = true;
      enable = true;
      cursors.enable = false;
    };
  };

  flake.modules.homeManager.catppuccin = {inputs, ...}: {
    imports = [(inputs.catppuccin.homeModules.catppuccin or {})];
    catppuccin = {
      autoEnable = true;
      enable = true;
      cursors.enable = false;
    };
  };
}
