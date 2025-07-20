{
  description = "Austin's Home Manager Linux Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations.austin =
      let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
      in
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            home.username = "austin";
            home.homeDirectory = "/home/austin";
            home.stateVersion = "23.11";
            targets.genericLinux.enable = true;
            programs.home-manager.enable = true;
            home.packages = with pkgs; [ git neovim gcc python3 rustup gh lazygit ];
	    xdg.configFile."nvim".source = ./nvim;
          }
        ];
      };
  };
}
