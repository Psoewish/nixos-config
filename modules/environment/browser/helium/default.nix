{ inputs, ... }: {
  imports = [ inputs.helium.nixosModules.default ];
  programs.helium.enable = true;

  environment.etc."chromium/policies/managed/policies.json".source = ./policies.json;
  environment.etc."chromium/policies/managed/extensions.json".source = ./extensions.json;
  environment.etc."helium/policies/managed/policies.json".source = ./policies.json;
  environment.etc."helium/policies/managed/extensions.json".source = ./extensions.json;
}
