{ config, pkgs, ... }:
let
  aagl-gtk-on-nix = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz");
  # aaglPkgs = aagl-gtk-on-nix.withNixpkgs pkgs
in
{
  imports = [
    aagl-gtk-on-nix.module
    # aaglPkgs.module
  ];

  programs.anime-game-launcher.enable = true;
  programs.anime-games-launcher.enable = true;
  programs.anime-borb-launcher.enable = true;
  programs.honkers-railway-launcher.enable = true;
  programs.honkers-launcher.enable = true;
  }
