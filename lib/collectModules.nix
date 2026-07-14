{ lib, ... }:
let
  inherit (lib) concatMap isFunction;
  inherit (builtins) isAttrs attrValues;
  collectModules =
    list:
    concatMap (
      value:
      if isFunction value then
        [ value ]
      else if isAttrs value && (value.__namespace or false) then
        collectModules (attrValues (removeAttrs value [ "__namespace" ]))
      else if isAttrs value then
        builtins.trace
          "collectModules: treating as LEAF (no tag) -> keys: ${builtins.toJSON (builtins.attrNames value)}"
          [ value ]
      else
        [ ]
    ) list;
in
collectModules
