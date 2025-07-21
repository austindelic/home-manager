# ~/.config/home-manager/modules/packages.nix

{ pkgs, ... }:

{
  home.packages = with pkgs; [ git neovim gcc python3 rustup gh lazygit ];
}
