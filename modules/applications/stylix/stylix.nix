toplevel @ {...}: {
  flake.modules.generic.stylix = {pkgs, ...}: {
    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${toplevel.config.flake.meta.theme}.yaml";
      image = ./wallpaper.png;

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      };

      icons = {
        enable = true;
        package = pkgs.gruvbox-plus-icons;
        dark = "Gruvbox Plus Dark";
      };

      fonts = {
        serif = {
          package = pkgs.inter;
          name = "Inter";
        };
        sansSerif = {
          package = pkgs.inter;
          name = "Inter";
        };
        monospace = {
          package = pkgs.maple-mono.NF-CN;
          name = "Maple Mono NF CN";
        };
        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };

        sizes = {
          applications = 11;
          desktop = 11;
          popups = 11;
          terminal = 11;
        };
      };
    };
  };

  flake.modules.nixos.stylix = {
    imports = [
      toplevel.inputs.stylix.nixosModules.stylix
      toplevel.inputs.self.modules.generic.stylix
    ];
    home-manager.sharedModules = [
      toplevel.inputs.stylix.homeModules.stylix
      toplevel.inputs.self.modules.homeManager.stylix
      {stylix.overlays.enable = false;}
    ];
    stylix.homeManagerIntegration = {
      autoImport = false;
      followSystem = false;
    };
  };

  flake.modules.homeManager.stylix = {
    imports = [toplevel.inputs.self.modules.generic.stylix];
  };
}
