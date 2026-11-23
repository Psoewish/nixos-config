{inputs, ...}: let
  defaultFonts = {
    serif = ["Inter"];
    sansSerif = ["Inter"];
    monospace = ["Maple Mono NF CN"];
    emoji = ["Noto Color Emoji"];
  };
in {
  den.aspects.catppuccin = {
    nixos = {pkgs, ...}: {
      imports = [inputs.catppuccin.nixosModules.catppuccin];
      catppuccin.enable = true;
      catppuccin.autoEnable = true;
      fonts = {
        packages = with pkgs; [
          inter
          maple-mono.NF-CN
          noto-fonts-color-emoji
        ];
        fontconfig = {
          enable = true;
          inherit defaultFonts;
        };
      };
    };

    homeManager = {pkgs, ...}: {
      imports = [inputs.catppuccin.homeModules.catppuccin];
      catppuccin.enable = true;
      catppuccin.autoEnable = true;

      gtk = {
        cursorTheme = {
          package = pkgs.phinger-cursors;
          name = "phinger-cursors-light";
          size = 24;
        };
        font = {
          name = "Inter";
          size = 11;
        };
      };

      fonts.fontconfig = {
        inherit defaultFonts;
      };
    };
  };
}
