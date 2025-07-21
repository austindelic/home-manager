{ pkgs, lib, ... }:

{
  home.activation.setRustupDefault =
    lib.hm.dag.entryAfter [ "installPackages" ] ''
      if ! ${pkgs.rustup}/bin/rustup show | grep -q "stable"; then
        echo "Setting rustup default to stable..."
        ${pkgs.rustup}/bin/rustup default stable
      fi
    '';
}

