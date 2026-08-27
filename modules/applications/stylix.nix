toplevel @ {config, ...}: {
  flake.modules.generic.stylix = {pkgs, ...}: {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${toplevel.config.global.theme}.yaml";

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

  flake.modules.nixos.stylix = {inputs, ...}: {
    imports = [
      (inputs.stylix.nixosModules.stylix or {})
      inputs.self.modules.generic.stylix
    ];
  };
}
