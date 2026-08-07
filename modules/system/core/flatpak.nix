{
  flake-file.inputs.nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

  flake.modules.nixos.core = {
    inputs,
    lib,
    config,
    ...
  }: {
    imports = [(inputs.nix-flatpak.nixosModules.nix-flatpak or {})];
    services.flatpak = lib.mkIf config.xdg.portal.enable {
      enable = true;
      update.auto = {
        enable = true;
        onCalendar = "weekly";
      };
      remotes = [
        {
          name = "flathub";
          location = "https://flathub.org/repo/flathub.flatpakrepo";
        }
        {
          name = "cosmic";
          location = "https://apt.pop-os.org/cosmic/cosmic.flatpakrepo";
        }
      ];
    };
  };
}
