{
  pkgs,
  lib,
  ...
}: {
  programs.fish = {
    enable = true;
    useBabelfish = true;
  };

  environment.systemPackages = with pkgs.fishPlugins; [
    autopair
    done
    puffer
    sponge
    plugin-sudope
    pure
    colored-man-pages
  ];

  hjem.users.psoewish = {
    xdg.config.files = {
      "fish/config.fish".source = lib.mkSymlink ./config/config.fish;
      "fish/functions".source = lib.mkSymlink ./config/functions;
    };
  };
}
