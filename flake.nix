{
  description = "Austin's Home Manager Linux Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations.austin = let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./modules/links.nix
        ./modules/packages.nix
        ./modules/post_install.nix
        ./modules/core.nix
      ];
    };
  };
}

