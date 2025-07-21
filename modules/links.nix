# ~/.config/home-manager/modules/config_links.nix

{ config, lib, ... }:

let
  # Relative to the user's home directory, NOT absolute!
  configDir = ".config/home-manager/configs";
  configNames = builtins.attrNames (builtins.readDir ../../configs);
in {
  home.file = builtins.listToAttrs (map (name: {
    name = ".config/${name}";
    value.source = "${configDir}/${name}";
  }) configNames);
}

