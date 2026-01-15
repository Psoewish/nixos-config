{ ... }:
{
  virtualisation.oci-containers.containers = {
    bookshelf = {
      image = "ghcr.io/pennydreadful/bookshelf:hardcover";
      pull = "always";
      hostname = "bookshelf";
      user = "5000:5000";
      ports = [ "8787:8787" ];
      volumes = [
        "/var/lib/bookshelf:/config"
        "/data/media/ebooks:/books"
      ];
    };
  };
  homelab.routes.bookshelf = {
    subdomain = "bookshelf";
    port = 8787;
    public = false;
  };
}
