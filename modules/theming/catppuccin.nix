{
  flake-file.inputs.catppuccin.url = "github:catppuccin/nix";
  flake.modules.nixos.catppuccin = { inputs, pkgs, ... }: {
    imports = with inputs; [
      (catppuccin.nixosModules.catppuccin or { })
      modules.nixos.theme-base
      modules.homeManager.theme-base
      modules.homeManager.catppuccin
    ];
    catppuccin = {
      autoEnable = true;
      enable = true;
      cursors.enable = false;
    };
  };

  flake.modules.homeManager.catppuccin = { inputs, pkgs, ... }: {
    imports = [ (inputs.catppuccin.homeModules.catppuccin or { }) ];
    catppuccin = {
      autoEnable = true;
      enable = true;
      cursors.enable = false;
    };
  };
}
