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
        ./modules/packages.nix
        ./modules/post_install.nix
        ./modules/core.nix
        # This is a lambda (function) that gets special lib from Home Manager
        ({ pkgs, lib, config, ... }: {

          home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
            "${config.home.homeDirectory}/.config/home-manager/configs/nvim";

          # ✅ Correctly placed inside module lambda, using HM's extended `lib`

        })
      ];
    };
  };
}

