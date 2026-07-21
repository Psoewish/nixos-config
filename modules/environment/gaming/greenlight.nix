{...}: {
  services.flatpak.packages = [
    {
      appId = "io.github.unknownskl.greenlight";
      origin = "flathub";
    }
  ];
}
