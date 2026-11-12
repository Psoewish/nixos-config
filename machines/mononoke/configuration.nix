{den, ...}: {
  den.hosts.mononoke = {
    system = "x86_64-linux";
    theme = "soft-server";
    users.psoewish = {};

    kernel = {
      package = "linuxPackages";
      modules = ["kvm-intel"];
    };
    networking = {
      interface = "enp94s0";
      address = "192.168.1.100";
      allowedTCPPorts = [53 80 443];
      allowedUDPPorts = [53];
    };
    includes = [den.aspects.common._];
  };

  den.aspects.mononoke.includes = with den.aspects; [
    dev.git
    dev.editors.helix
    shell.fish
    stylix
  ];
}
