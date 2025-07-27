{ pkgs, lib, config, ... }:

{
  home.activation.setRustupDefault =
    lib.hm.dag.entryAfter [ "installPackages" ] ''
      if ! ${pkgs.rustup}/bin/rustup show | grep -q "stable"; then
        echo "Setting rustup default to stable..."
        ${pkgs.rustup}/bin/rustup default stable
      fi
    '';
  home.activation.make-fish-default-shell =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      # Ensure required tools are in PATH
      PATH="/usr/bin:/bin:$PATH"

      FISH_PATH="${config.home.homeDirectory}/.nix-profile/bin/fish"
      USER=$(whoami)

      # Check if fish is already the default shell
      if ! getent passwd "$USER" | grep -q "$FISH_PATH"; then
        echo "Setting fish as default shell. Password may be required."

        # Add fish path to /etc/shells if it's not already there
        if ! grep -q "$FISH_PATH" /etc/shells; then
          echo "Adding $FISH_PATH to /etc/shells"
          echo "$FISH_PATH" | sudo tee -a /etc/shells
        fi

        # Change login shell to fish
        echo "Running chsh to set fish as login shell"
        sudo chsh -s "$FISH_PATH" "$USER"
        echo "Fish shell is now set as your default shell!"
      fi
    '';

}

