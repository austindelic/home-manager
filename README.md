
# 🛠️ Home Manager Flake Setup (No Git Required)

This guide installs your Home Manager configuration using only Nix flake commands — **no `git` needed**.

---

## ✅ Prerequisites

### Install curl

`sudo apt install curl`

## Install script

```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
nix flake clone github:austindelic/home-manager --dest ~/.config/home-manager
nix run github:nix-community/home-manager -- switch --flake ~/.config/home-manager#austin
sudo chown -R $USER:$USER ~/.config/nvim
sudo chmod -R u+w ~/.config/nvim
```

