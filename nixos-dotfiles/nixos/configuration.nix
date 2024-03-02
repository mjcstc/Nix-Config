
{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./services.nix
      ./fonts.nix
      ./printer.nix
      ./aagl.nix
    #  ./nvidia.nix
    ];


    #This block is ugly as shit, I'll fix it later
  nixpkgs.config.allowUnfree = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  programs.kdeconnect.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;
 programs.gamescope.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  programs.pantheon-tweaks.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  programs.steam.enable = true;   
   time.timeZone = "America/Nassau";
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;
 nix.settings.experimental-features = [ "nix-command" "flakes" ];
   i18n.defaultLocale = "en_US.UTF-8"; 

systemd.extraConfig = ''
  DefaultTimeoutStopSec=1s
'';
	

boot.supportedFilesystems = [ "ntfs" ];

services.flatpak.enable = true;
   console = {
     font = "Lat2-Terminus16";
#     keyMap = "us";
     useXkbConfig = true; # use xkb.options in tty.
   };

  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
};


    programs.starship.enable = true;
    services.printing.enable = true;
    sound.enable = true;
    hardware.pulseaudio.enable = true;


   users.users.cjrminus = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
	wingpanel-indicator-ayatana
        librewolf
	linuxConsoleTools
pkgs.pantheon.pantheon-agent-polkit
	osu-lazer-bin
	discord
        floorp
#	vinegar	
	onlyoffice-bin
  networkmanagerapplet
	swaynotificationcenter
	waybar
  git-credential-manager
	wlogout
  xwaylandvideobridge
  pkgs.libsForQt5.qtstyleplugin-kvantum
	swappy
	libnotify
	vscode
	pkgs.qt6Packages.qtstyleplugin-kvantum	
	neovim
       tree
     ];
   };

   environment.systemPackages = with pkgs; [
 	vim
	home-manager		 
 	wget
	busybox
	freshfetch
	ninja
	git

	pkgs.meson
   ];

  system.stateVersion = "23.11"; # Did you read the comment?

}

