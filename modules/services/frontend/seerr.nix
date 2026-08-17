{
  flake.modules.nixos.jellyseerr = {
    services.seerr = {
      enable = true;
      configDir = "/var/lib/seerr/";
    };
  };

  routes.seerr = {
    aliases = ["jellyseerr"];
    port = 5055;
    public = true;
  };
}
