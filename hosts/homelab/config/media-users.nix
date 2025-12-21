{ lib, ... }:
let
  mediaServices = [
    "jellyfin"
    "sonarr"
    "radarr"
    "bazarr"
    "sabnzbd"
    "unmanic"
    "transmission"
  ];
in
{
  users.groups.media = { };

  users.users = lib.mkMerge (
    map (service: {
      ${service}.extraGroups = [ "media" ];
    }) mediaServices
  );

  systemd.services = lib.mkMerge (
    map (service: {
      ${service}.serviceConfig.UMask = lib.mkForce "0002";
    }) mediaServices
  );

  # Set media group cross-permissions
  systemd.tmpfiles.rules = [
    "d /data/media 0775 root media -"
    "Z /data/media - - - - -"
    "d /var/lib/sabnzbd/Downloads 0775 sabnzbd media -"
    "Z /var/lib/sabnzbd/Downloads - - - - -"
    "d /var/lib/transmission/Downloads 0775 transmission media -"
    "Z /var/lib/transmission/Downloads - - - - -"
    "a+ /data/media - - - - group:media:rwx,default:group:media:rwx"
    "a+ /var/lib/sabnzbd/Downloads - - - - group:media:rwx,default:group:media:rwx"
    "a+ /var/lib/transmission/Downloads - - - - group:media:rwx,default:group:media:rwx"
  ];
}
