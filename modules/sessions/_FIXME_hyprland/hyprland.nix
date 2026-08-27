{
  flake.modules.nixos.hyprland = {
    inputs,
    pkgs,
    ...
  }: {
    imports = with inputs.self.modules; [
      nixos.greeter
      homeManager.hyprland
    ];
    programs.hyprland.enable = true;

    services = {
      gnome.gnome-keyring.enable = true;
      gvfs.enable = true;
      tumbler.enable = true;
      udisks2 = {
        enable = true;
        mountOnMedia = true;
      };
      power-profiles-daemon.enable = true;
    };

    security = {
      polkit.enable = true;
      pam.services.login.enableGnomeKeyring = true;
    };

    environment.systemPackages = with pkgs; [
      wl-clipboard-rs
      wl-clip-persist
      cliphist
      hyprshot
      hyprcursor
      nautilus
      noctalia
    ];

    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "ghostty";
    };
  };

  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.variables = ["--all"];
    };
  };
}
