{ lib, ... }:
let
  findNixFiles =
    dir:
    let
      entries = builtins.readDir dir;
      processEntry =
        name: type:
        let
          modulePath = dir + "/${name}";
        in
        if type == "directory" then
          findNixFiles modulePath
        else if type == "regular" && lib.hasSuffix ".nix" name then
          [ modulePath ]
        else
          [ ];
      allFiles = lib.flatten (lib.mapAttrsToList processEntry entries);
    in
    allFiles;

  extractTags =
    modulePath:
    let
      module = import modulePath;
      moduleAttrs =
        if builtins.isFunction module then
          module {
            inputs = { };
            lib = lib;
            pkgs = null;
            config = { };
            options = { };
            modulesPath = null;
            username = "";
          }
        else
          module;

      tags = moduleAttrs.fractal.tags or [ ];
    in
    {
      inherit modulePath tags;
    };

  buildTagMap =
    moduleInfoList:
    lib.foldl' (
      acc:
      { modulePath, tags }:
      lib.foldl' (
        acc: tag:
        acc
        // {
          ${tag} = (acc.${tag} or [ ]) ++ [ modulePath ];
        }
      ) acc tags
    ) { } moduleInfoList;

  scanDirectory =
    dir:
    let
      nixFiles = findNixFiles dir;
      moduleInfos = map extractTags nixFiles;
    in
    buildTagMap moduleInfos;
in
{
  inherit
    findNixFiles
    extractTags
    buildTagMap
    scanDirectory
    ;
}
