# ~/.config/home-manager/modules/packages.nix

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nix
    git
    neovim
    gcc
    python3
    rustup
    gh
    lazygit
    fd
  ];
}
