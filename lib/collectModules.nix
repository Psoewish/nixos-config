_: final: prev: {
  collectModules = let
    inherit (prev) concatMap isFunction;
    inherit (builtins) isAttrs attrValues;
    collectModules = list:
      concatMap (
        value:
          if isFunction value
          then [value]
          else if isAttrs value && (value.__namespace or false)
          then collectModules (attrValues (removeAttrs value ["__namespace"]))
          else if isAttrs value
          then [value]
          else []
      )
      list;
  in
    collectModules;
}
