toplevel @ {config, ...}: {
  flake.modules.nixos.virtualisation = {pkgs, ...}: {
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.swtpm.enable = true;
      };
      spiceUSBRedirection.enable = true;
    };

    users.groups = {
      libvirtd.members = [toplevel.config.flake.metadata.primaryUser.username];
      kvm.members = [toplevel.config.flake.metadata.primaryUser.username];
    };

    environment.systemPackages = with pkgs; [
      gnome-boxes
      dnsmasq
      phodav
      docker-compose
    ];
  };
}
