{ config, pkgs, nixgl, ... }:

{
  nixGL.packages = nixgl.packages;
  nixGL.defaultWrapper = "mesa"; # or the driver you need
  nixGL.installScripts = [ "mesa" ];
  home = {
  packages = with pkgs; [
    
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to installgho Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # Apps:
    (config.lib.nixGL.wrap ghostty)
    (config.lib.nixGL.wrap spotify)
    vscode

    # Packages:
    hello
    just
    zsh
    rustup
    eza
    btop
    lazygit
    yazi
    neovim
    tmux
    bat
    gh
    doctl
    kubectl
    terraform
    nodejs
    helm

    # Fonts:
    nerd-fonts.jetbrains-mono
  ];

    # This needs to actually be set to your username
    username = "adelic";
    homeDirectory = "/home/adelic";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "25.05";

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    ".zshenv" = {
  source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/zsh/.zshenv";
};
".config/zsh" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/zsh/config";
    recursive = true;
  };
  ".config/yazi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/yazi";
    recursive = true;
  };
  ".config/tmux" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/tmux";
    recursive = true;
  };
  ".config/p10k" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/p10k";
    recursive = true;
  };
  ".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/nvim";
    recursive = true;
  };
  ".config/lazygit" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/lazygit";
    recursive = true;
  };
  ".config/ghostty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/ghostty";
    recursive = true;
  };
  ".config/eza" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/eza";
    recursive = true;
  };
  ".config/btop" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/btop";
    recursive = true;
  };
  ".config/antidote" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/antidote";
    recursive = true;
  };
  ".config/Code/User/settings.json" = {
  source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.home-manager/dotfiles/vscode/settings.json";
};
  };
  sessionVariables = {
    # EDITOR = "emacs";
  };

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
