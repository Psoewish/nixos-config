{ pkgs, username, ... }:
{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };
    spiceUSBRedirection.enable = true;
    docker.enable = true;
  };

  users.groups = {
    libvirtd.members = [ username ];
    kvm.members = [ username ];
    docker.members = [ username ];
  };

  environment.systemPackages = with pkgs; [
    gnome-boxes
    dnsmasq
    phodav
    winboat
    docker-compose
  ];
}
