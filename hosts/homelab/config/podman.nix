{ ... }:
{
  # Enable Podman for containerized services
  virtualisation.podman = {
    enable = true;
    # Use the new docker-compatible API
    dockerSocket.enable = true;
  };

  # Enable OCI container support for systemd integration
  virtualisation.oci-containers.backend = "podman";
}
