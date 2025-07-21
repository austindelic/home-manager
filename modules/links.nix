# ~/.config/home-manager/modules/config_links.nix

{ config, lib, ... }:

let
  # Relative path inside the flake
  configDir = ./../configs;
  dotConfigs = builtins.attrNames (builtins.readDir configDir);
in {
  home.file = builtins.listToAttrs (map (name: {
    name = ".config/${name}";
    value.source = configDir + "/${name}";
  }) dotConfigs);
}

