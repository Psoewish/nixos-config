{pkgs, ...}: {
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };
    spiceUSBRedirection.enable = true;
    docker.enable = true;
  };

  users.groups = {
    libvirtd.members = ["psoewish"];
    kvm.members = ["psoewish"];
    docker.members = ["psoewish"];
  };

  environment.systemPackages = with pkgs; [
    gnome-boxes
    dnsmasq
    phodav
    docker-compose
  ];
}
