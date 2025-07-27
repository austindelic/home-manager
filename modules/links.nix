# ~/.config/home-manager/modules/config_links.nix

{ config, ... }:

{
  home.file = {
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/.config/home-manager/configs/nvim";
    };
  };
}

