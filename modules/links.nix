# ~/.config/home-manager/modules/config_links.nix

{ config, lib, ... }:

let
  configDir = ./../configs;
  dotConfigs = builtins.attrNames (builtins.readDir configDir);
in {
  home.file = builtins.listToAttrs (map (name: {
    name = ".config/${name}";
    value = {
      source = configDir
        + "/${name}"; # this is correct as long as configDir is a path
    };
  }) dotConfigs);
}

