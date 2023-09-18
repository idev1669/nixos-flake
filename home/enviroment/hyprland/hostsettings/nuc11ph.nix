{ config, lib, pkgs, uservars, gpuvar, ... }:

{
  wayland.windowManager.hyprland = {
    enableNvidiaPatches = true;
    settings.monitor = [
    ] ++ lib.lists.optionals (gpuvar == "nvidiaprimehdmi") [
      "HDMI-A-1,3440x1440@100,0x0,1"
		] ++ lib.lists.optionals (gpuvar == "nvidiaprimetb") [
			"DP-3,3440x1440@100,0x0,1"
      "DP-4,1920x1080@60,3440x0,1"
		];
  };
  home.sessionVariables = {
		#universal part
    NIXOS_OZONE_WL = "1";
	  QT_QPA_PLATFORMTHEME = "gtk3";
	  QT_SCALE_FACTOR = "1";
	  MOZ_ENABLE_WAYLAND = "1";
	  SDL_VIDEODRIVER = "wayland";
	  _JAVA_AWT_WM_NONREPARENTING = "1";
	  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
	  QT_AUTO_SCREEN_SCALE_FACTOR = "1"; 
	  CLUTTER_BACKEND = "wayland";
	  XDG_CURRENT_DESKTOP = "Hyprland";
	  XDG_SESSION_DESKTOP = "Hyprland";
	  XDG_SESSION_TYPE = "wayland";
	  GTK_USE_PORTAL = "1";
	  NIXOS_XDG_OPEN_USE_PORTAL = "1";

		#nvidia part
		QT_QPA_PLATFORM = "wayland-egl";#universal?
		WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
  } // lib.optionalAttrs (gpuvar == "nvidiaprimehdmi") {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
	  LIBVA_DRIVER_NAME = "nvidia";
	  WLR_RENDERER = "vulkan";
		__NV_PRIME_RENDER_OFFLOAD="1";
	};
}
