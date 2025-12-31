{ config, ... }:
{
  fractal.tags = [ "homelab" ];
  systemd.services.recyclarr.serviceConfig.LoadCredential = [
    "sonarr_api:${config.sops.secrets."sonarr/api".path}"
    "radarr_api:${config.sops.secrets."radarr/api".path}"
  ];
  services.recyclarr = {
    enable = true;
    configuration = {
      sonarr = {
        sonarr = {
          base_url = "http://localhost:8989";
          api_key = {
            _secret = "/run/credentials/recyclarr.service/sonarr_api";
          };
          media_naming = {
            series = "jellyfin-tvdb";
            season = "default";
            episodes = {
              rename = true;
              standard = "default";
              daily = "default";
              anime = "default";
            };
          };
          quality_profiles = [
            {
              name = "WEB-1080p";
              reset_unmatched_scores = {
                enabled = true;
              };
              upgrade = {
                allowed = true;
                until_quality = "WEB 1080p";
                until_score = 10000;
              };
              min_format_score = 0;
              score_set = "default";
              quality_sort = "top";
              qualities = [
                {
                  name = "Bluray-1080p";
                  qualities = [
                    "Bluray-1080p Remux"
                    "Bluray-1080p"
                  ];
                }
                {
                  name = "WEB 1080p";
                  qualities = [
                    "WEBDL-1080p"
                    "WEBRip-1080p"
                    "HDTV-1080p"
                  ];
                }
                {
                  name = "Bluray-720p";
                }
                {
                  name = "WEB 720p";
                  qualities = [
                    "WEBDL-720p"
                    "WEBRip-720p"
                    "HDTV-720p"
                  ];
                }
                {
                  name = "Bluray-480p";
                }
                {
                  name = "WEB 480p";
                  qualities = [
                    "WEBDL-480p"
                    "WEBRip-480p"
                  ];
                }
                {
                  name = "DVD";
                }
                {
                  name = "SDTV";
                }
              ];
            }
            {
              name = "Remux-1080p - Anime";
              reset_unmatched_scores = {
                enabled = true;
              };
              upgrade = {
                allowed = true;
                until_quality = "WEB 1080p";
                until_score = 10000;
              };
              min_format_score = 0;
              score_set = "anime-sonarr";
              quality_sort = "top";
              qualities = [
                {
                  name = "Bluray-1080p";
                  qualities = [
                    "Bluray-1080p Remux"
                    "Bluray-1080p"
                  ];
                }
                {
                  name = "WEB 1080p";
                  qualities = [
                    "WEBDL-1080p"
                    "WEBRip-1080p"
                    "HDTV-1080p"
                  ];
                }
                {
                  name = "Bluray-720p";
                }
                {
                  name = "WEB 720p";
                  qualities = [
                    "WEBDL-720p"
                    "WEBRip-720p"
                    "HDTV-720p"
                  ];
                }
                {
                  name = "Bluray-480p";
                }
                {
                  name = "WEB 480p";
                  qualities = [
                    "WEBDL-480p"
                    "WEBRip-480p"
                  ];
                }
                {
                  name = "DVD";
                }
                {
                  name = "SDTV";
                }
              ];
            }
          ];
          include = [
            {
              template = "sonarr-v4-custom-formats-web-1080p";
            }
            {
              template = "sonarr-v4-custom-formats-anime";
            }
          ];
          custom_formats = [
            {
              trash_ids = [
                "47435ece6b99a0b477caf360e79ba0bb"
              ];
              assign_scores_to = [
                {
                  name = "WEB-1080p";
                  score = 0;
                }
                {
                  name = "Remux-1080p - Anime";
                  score = 0;
                }
              ];
            }
          ];
        };
      };
      radarr = {
        radarr = {
          base_url = "http://localhost:7878";
          api_key = {
            _secret = "/run/credentials/recyclarr.service/radarr_api";
          };
          media_naming = {
            folder = "jellyfin-tmdb";
            movie = {
              rename = true;
              standard = "jellyfin-tmdb";
            };
          };
          quality_profiles = [
            {
              name = "HD Bluray + WEB";
              reset_unmatched_scores = {
                enabled = true;
              };
              upgrade = {
                allowed = true;
                until_quality = "WEB 1080p";
                until_score = 10000;
              };
              min_format_score = 0;
              score_set = "default";
              quality_sort = "top";
              qualities = [
                {
                  name = "Remux-1080p";
                  qualities = [
                    "Bluray-1080p"
                    "Remux-1080p"
                  ];
                }
                {
                  name = "WEB 1080p";
                  qualities = [
                    "WEBDL-1080p"
                    "WEBRip-1080p"
                    "HDTV-1080p"
                  ];
                }
                {
                  name = "Bluray-720p";
                }
                {
                  name = "WEB 720p";
                  qualities = [
                    "WEBDL-720p"
                    "WEBRip-720p"
                    "HDTV-720p"
                  ];
                }
                {
                  name = "Bluray-576p";
                }
                {
                  name = "Bluray-480p";
                }
                {
                  name = "WEB 480p";
                  qualities = [
                    "WEBDL-480p"
                    "WEBRip-480p"
                  ];
                }
                {
                  name = "DVD";
                }
                {
                  name = "SDTV";
                }
              ];
            }
            {
              name = "Remux-1080p - Anime";
              reset_unmatched_scores = {
                enabled = true;
              };
              upgrade = {
                allowed = true;
                until_quality = "WEB 1080p";
                until_score = 10000;
              };
              min_format_score = 0;
              score_set = "anime-radarr";
              quality_sort = "top";
              qualities = [
                {
                  name = "Remux-1080p";
                  qualities = [
                    "Bluray-1080p"
                    "Remux-1080p"
                  ];
                }
                {
                  name = "WEB 1080p";
                  qualities = [
                    "WEBDL-1080p"
                    "WEBRip-1080p"
                    "HDTV-1080p"
                  ];
                }
                {
                  name = "Bluray-720p";
                }
                {
                  name = "WEB 720p";
                  qualities = [
                    "WEBDL-720p"
                    "WEBRip-720p"
                    "HDTV-720p"
                  ];
                }
                {
                  name = "Bluray-576p";
                }
                {
                  name = "Bluray-480p";
                }
                {
                  name = "WEB 480p";
                  qualities = [
                    "WEBDL-480p"
                    "WEBRip-480p"
                  ];
                }
                {
                  name = "DVD";
                }
                {
                  name = "SDTV";
                }
              ];
            }
          ];
          include = [
            {
              template = "radarr-custom-formats-hd-bluray-web";
            }
            {
              template = "radarr-custom-formats-anime";
            }
          ];
          custom_formats = [
            {
              trash_ids = [
                "dc98083864ea246d05a42df0d05f81cc"
              ];
              assign_scores_to = [
                {
                  name = "HD Bluray + WEB";
                  score = 0;
                }
                {
                  name = "Remux-1080p - Anime";
                  score = 0;
                }
              ];
            }
          ];
        };
      };
    };
  };
}
