{
  flake.modules.nixos.virtualisation = {
    pkgs,
    config,
    ...
  }: {
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.swtpm.enable = true;
      };
      spiceUSBRedirection.enable = true;
    };

    users.groups = {
      libvirtd.members = [config.global.primaryUser];
      kvm.members = [config.global.primaryUser];
    };

    environment.systemPackages = with pkgs; [
      gnome-boxes
      dnsmasq
      phodav
      docker-compose
    ];
  };
}
