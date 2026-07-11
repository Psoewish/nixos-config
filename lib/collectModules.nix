{ lib, ... }:
let
  inherit (lib) concatMap isFunction;
  inherit (builtins) isAttrs attrValues;
  collectModules =
    list:
    concatMap (
      attrs:
      concatMap (
        value:
        if isFunction value then
          [ value ]
        else if isAttrs value then
          collectModules [ value ]
        else
          [ ]
      ) (attrValues attrs)
    ) list;
in
collectModules
