{den, ...}: {
  den.hosts.nausicaa = {
    system = "x86_64-linux";
    users.psoewish = {};
    theme = "soft-server";
    kernel = {
      package = "linuxPackages_zen";
      modules = ["kvm-amd"];
    };
    networking = {
      interface = "enp9s0";
      address = "192.168.1.16";
    };
    includes = [den.aspects.common._];
  };

  den.aspects.nausicaa.includes = with den.aspects; [
    dev.git
    dev.editors._
    gaming._
    input-devices._
    mango
    shell.fish
    discord
    foot
    browsers.helium
    media._
    stylix
  ];
}
