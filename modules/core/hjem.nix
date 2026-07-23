{inputs,lib,...}:
let
inherit (lib) mkAliasOptionModule;
username = "psoewish";
in{
  imports = [inputs.hjem.nixosModules.default
    (mkAliasOptionModule ["home"] ["hjem" "users" username])
];
  hjem.clobberByDefault = true;
  hjem.specialArgs = {inherit inputs;};
  hjem.users.${username} = {
    enable = true;
    directory = "/home/${username}";
  };
}
