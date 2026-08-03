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
      docker.enable = true;
    };

    users.groups = {
      libvirtd.members = [config.constants.primaryUser];
      kvm.members = [config.constants.primaryUser];
      docker.members = [config.constants.primaryUser];
    };

    environment.systemPackages = with pkgs; [
      gnome-boxes
      dnsmasq
      phodav
      docker-compose
    ];
  };
}
