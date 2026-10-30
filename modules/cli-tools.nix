{
  pkgs,
  inputs,
  ...
}: {
  programs.nix-ld.enable = true;
  home.config = {
    imports = [inputs.nix-index-database.homeModules.default];
    home.packages =
      [inputs.nix-alien.packages.${pkgs.stdenv.hostPlatform.system}.nix-alien]
      ++ (with pkgs; [
        curl
        fd
        fzf
        jq
        killall
        socat
        wget
        unzip
        unrar
        zip
        bind
        wl-clipboard-rs
        wl-clip-persist

        grim
        slurp
        satty
        wayfreeze
      ]);
    programs = {
      eza = {
        enable = true;
        git = true;
        icons = "always";
        extraOptions = [
          "--group-directories-first"
          "--octal-permissions"
          "--smart-group"
        ];
      };
      bat = {
        enable = true;
        extraPackages = with pkgs.bat-extras; [batman batgrep];
        config = {
          style = "plain";
          color = "always";
          pager = "less -RXFKS";
        };
      };
      btop = {
        enable = true;
        settings.rounded_corners = false;
      };
      nix-index-database.comma.enable = true;
      nix-index.enable = true;
    };
  };
}
