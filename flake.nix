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
          # This is a lambda (function) that gets special lib from Home Manager
          ({ pkgs, lib, config, ... }: {
            home.username = "austin";
            home.homeDirectory = "/home/austin";
            home.stateVersion = "23.11";
            targets.genericLinux.enable = true;
            programs.home-manager.enable = true;

            home.packages = with pkgs; [
              git
              neovim
              gcc
              python3
              rustup
              gh
              lazygit
            ];

             home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/configs/nvim";

            # ✅ Correctly placed inside module lambda, using HM's extended `lib`
            home.activation.setRustupDefault = lib.hm.dag.entryAfter [ "installPackages" ] ''
              if ! ${pkgs.rustup}/bin/rustup show | grep -q "stable"; then
                echo "Setting rustup default to stable..."
                ${pkgs.rustup}/bin/rustup default stable
              fi
            '';
          })
        ];
      };
  };
}

