{inputs, ...}: {
  den.aspects.stylix = {
    homeManager = {
      stylix.targets.rofi.enable = false; # temporary until upstream bug gets fixed
    };

    nixos = {
      pkgs,
      config,
      host,
      ...
    }: {
      imports = [inputs.stylix.nixosModules.stylix];
      stylix = {
        enable = true;
        base16Scheme =
          if (host ? theme)
          then inputs.basix.schemeData.base16.${host.theme}
          else inputs.basix.schemeData.base16.soft-server;
        polarity = "dark";
        image = inputs.self.outPath + "/assets/wall.png";
        cursor = {
          name = "phinger-cursors-light";
          package = pkgs.phinger-cursors;
          size = 24;
        };
        icons = {
          enable = true;
          package = pkgs.kora-icon-theme;
          dark = "kora";
        };
        fonts = {
          sansSerif = {
            package = pkgs.inter;
            name = "Inter";
          };
          serif = config.stylix.fonts.sansSerif;
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
            desktop = 10;
          };
        };
        opacity.terminal = 0.85;
      };
    };
  };
}
