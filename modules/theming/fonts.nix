{
  flake.modules.nixos.theme-base = { pkgs, ... }: {
    fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;
      packages = with pkgs; [
        maple-mono.NF-CN
        inter
      ];

      fontconfig = {
        defaultFonts = {
          serif = [ "Maple Mono NF CN" ];
          sansSerif = [ "Inter" ];
          monospace = [ "Maple Mono NF CN" ];
        };
      };
    };
  };
}
