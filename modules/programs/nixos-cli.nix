{
  flake.modules.nixos.nixos-cli = {
    inputs,
    pkgs,
    ...
  }: {
    nix.settings = {
      substituters = ["https://watersucks.cachix.org"];
      trusted-public-keys = [
        "watersucks.cachix.org-1:6gadPC5R8iLWQ3EUtfu3GFrVY7X6I4Fwz/ihW25Jbv8="
      ];
    };
    imports = [inputs.nixos-cli.nixosModules.nixos-cli];
    environment.systemPackages = with pkgs; [nvd nix-output-monitor];
    programs.nixos-cli = {
      enable = true;
      option-cache.exclude = ["age"];
      settings = {
        apply = {
          reexec_as_root = true;
          use_nom = true;
        };
        confirmation = {
          empty = "default-yes";
        };
        differ = {
          tool = "command";
          command = ["nvd" "diff"];
        };
      };
    };
  };
}
