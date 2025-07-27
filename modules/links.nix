# ~/.config/home-manager/modules/config_links.nix

{ config, ... }:

{
  home.file = {
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "/home/austin/.config/home-manager/configs/nvim";
      recursive = true;
    };
  };
}

