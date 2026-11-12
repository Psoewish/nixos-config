{
  inputs,
  den,
  ...
}: {
  den.aspects.mango = {
    nixos = {
      imports = with inputs; [mangowm.nixosModules.mango];
      programs.fish.loginShellInit = "test (tty) = /dev/tty1; and exec mango";

      programs.mango.enable = true;
      services.gnome.gnome-keyring.enable = true;
    };
    homeManager = {
      imports = [inputs.mangowm.hmModules.mango];
      wayland.windowManager.mango = {
        enable = true;
        extraConfig = ''
          source=~/.config/mango/noctalia.conf
        '';
      };
    };
    includes = [den.aspects.mango._];
  };
}
