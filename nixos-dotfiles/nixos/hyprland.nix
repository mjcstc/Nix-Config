{ config, lib, pkgs, ... }:

{
  services.xserver.displayManager.sddm.enable = true;
  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
};



  environment.systemPackages = with pkgs; [
  #main ricing utilities
    waybar
    waypaper
    swaynotificationcenter
    avizo
    grim
    swappy
    slurp
    libnotify
    wl-clipboard
    pavucontrol
    wofi
    foot
    wlogout
  # File manager 
  io.elementary.files
  gnome.gnome-tweaks
  playerctl


   ];




















}