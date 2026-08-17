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
      libvirtd.members = [toplevel.config.global.primaryUser];
      kvm.members = [toplevel.config.global.primaryUser];
    };

    environment.systemPackages = with pkgs; [
      gnome-boxes
      dnsmasq
      phodav
      docker-compose
    ];
  };
}
