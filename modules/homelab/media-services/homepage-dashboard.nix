{ ... }:
{
  services.homepage-dashboard = {
    enable = true;

    settings = {
      title = "Psoewish's Homepage";
      description = "My custom homepage";
      headerStyle = "boxedWidgets";
      background = {
        image = "https://github.com/NotAShelf/wallpkgs/blob/main/wallpapers/catppuccin/catppuccin-atlantis.jpg?raw=true";
        blur = "sm";
      };
    };

    widgets = [
      {
        resources = {
          label = "System";
          cpu = true;
          memory = true;
        };
      }
      {
        resources = {
          label = "Storage";
          expanded = true;
          disk = [
            "/var/lib"
            "/data/media"
          ];
        };
      }
      {
        search = {
          provider = "duckduckgo";
        };
      }
    ];
  };
}
