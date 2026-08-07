{
  perSystem = {config,pkgs,...}:{
    devShells.default = pkgs.mkShell {
      nativeBuildInputs = [config.agenix-rekey.package];
    };
  };
}
