{ pkgs, username, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;

  users.groups = {
    libvirtd.members = [ username ];
    kvm.members = [ username ];
  };

  environment.systemPackages = with pkgs; [
    gnome-boxes
    dnsmasq
    phodav
  ];
}
