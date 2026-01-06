{ username, ... }:
{
  virtualisation.oci-containers.backend = "podman";
  users.users.${username}.extraGroups = [ "podman" ];

  virtualisation.podman = {
    enable = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = [ "--all" ];
    };
  };
}
