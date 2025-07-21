# ~/.config/home-manager/modules/config_links.nix

{ config, lib, ... }:

let
  # Absolute path to your editable config source dir
  configDir = "${config.home.homeDirectory}/.config/home-manager/configs";

  # Read all entries in the configs directory
  dotConfigs = builtins.attrNames (builtins.readDir configDir);
in {
  home.file = builtins.listToAttrs (map (name: {
    name = ".config/${name}";
    value.source = lib.file.mkOutOfStoreSymlink "${configDir}/${name}";
  }) dotConfigs);
}

