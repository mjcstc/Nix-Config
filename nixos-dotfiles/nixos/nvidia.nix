{ inputs, config, pkgs, ...}:

{
hardware.opengl = {
	enable = true;
	driSupport = true;
	driSupport32Bit = true;
};
services.xserver = {
	enable = true;
	videoDrivers = ["nvidia"];
};



hardware.opengl.extraPackages = [ 
pkgs.nvidia-vaapi-driver
pkgs.libvdpau-va-gl
 	]; 

					#NVIDIA doesn't support libvdpau, so this package will redirect VDPAU calls to LIBVA.
environment.variables.VDPAU_DRIVER = "va_gl";
environment.variables.LIBVA_DRIVER_NAME = "nvidia";
#environment.sessionVariables.NIXOS_OZONE_WL = "1";
#environment.sessionVariables.WAYLAND_DISPLAY = "1";
hardware.nvidia = {
 modesetting.enable = true;
 powerManagement.enable = true;
 powerManagement.finegrained = false;
 open = false;
 package = config.boot.kernelPackages.nvidiaPackages.production;
};


























}
