{ lib
, config
, pkgs
, cpuvar
, gpuvar
, uservars
, ...
}:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = (with pkgs; [
        libva
        vaapiVdpau
        libvdpau-va-gl
      ]) ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs; [
        nvidia-vaapi-driver
      ]) ++ lib.lists.optionals (cpuvar == "intel" || gpuvar.type == "intel") (with pkgs; [
        intel-media-driver
        vaapi-intel-hybrid
        intel-vaapi-driver
      ]);
      extraPackages32 = (with pkgs.pkgsi686Linux; [
        vaapiVdpau
        libvdpau-va-gl
      ]) ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") (with pkgs.pkgsi686Linux; [
        nvidia-vaapi-driver
      ]) ++ lib.lists.optionals (cpuvar == "intel" || gpuvar == "intel") (with pkgs.pkgsi686Linux; [
        intel-media-driver
        vaapi-intel-hybrid
        intel-vaapi-driver
      ]);
    };
  } // lib.optionalAttrs (gpuvar.type == "nvidia" && gpuvar.tech != "nvk") {
    nvidia = {
      open = true;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = true; 
      forceFullCompositionPipeline = true;
      # rtx 2060(laptop)-----------------
      # 535.154.05 - works, sync/offload
      # 550.54.14  - works, sync/offload, best performance
      # 550.67     - works, sync/offload
      # 550.76     - works, sync/offload
      # 550.78     - works, sync/offload
      # 555.42.02  - works, hdmi,         finaly works native(hdmi instead of thunderbolt)
      # 555.52.04  - works, hdmi,         
      # 560.28.03  - works, hdmi,         better performance, more glitchi on open-kernel-module
      # 545.29.02  - drm(VDPAU) failure
      # 545.29.06  - drm(VDPAU) failure
      # 550.40.07  - drm(VDPAU) failure
      #----------------------------------
      # rtx 3080-------------------------
      # 555.52.04  - works, hdmi,         
      # 560.28.03  - works, hdmi,         better performance, more glitchi on open-kernel-module
      # 560.31.02  - works, hdmi,         
      #----------------------------------
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "560.31.02";
        sha256_64bit = "sha256-0cwgejoFsefl2M6jdWZC+CKc58CqOXDjSi4saVPNKY0=";
        sha256_aarch64 = "sha256-+u0ZolZcZoej4nqPGmdn5qpyynLvu2QSm9Rd3wLdDmM=";
        openSha256 = "sha256-X5UzbIkILvo0QZlsTl9PisosgPj/XRmuuMH+cDohdZQ=";
        settingsSha256 = "sha256-A3SzGAW4vR2uxT1Cv+Pn+Sbm9lLF5a/DGzlnPhxVvmE=";
        persistencedSha256 = "sha256-MhITuC8tH/IPhCdUm60SrPOldOpitk78mH0rg+egkTE=";
      };
    } // lib.optionalAttrs (gpuvar.tech == "prime") {
      prime = {
        sync.enable = true;
        nvidiaBusId = "${gpuvar.busd}";
      } // lib.optionalAttrs (cpuvar == "intel") {
        intelBusId = "${gpuvar.busi}";
      } // lib.optionalAttrs (cpuvar == "amd") {
        amdBusId = "${gpuvar.busi}";
      };
    };
  };
  services.xserver.videoDrivers = [
  ] ++ lib.lists.optionals (gpuvar.type == "intel")[ "intel"
  ] ++ lib.lists.optionals (gpuvar.type == "nvidia" && gpuvar.tech != "nvk")[ "nvidia"
  ] ++ lib.lists.optionals (gpuvar.type == "amd" || cpuvar == "amd" ) [ "amdgpu" "radeon" ];
  environment = {
    systemPackages = [] ++ lib.optional (gpuvar.type == "nvidia") pkgs.egl-wayland;
    variables = {
    } // lib.optionalAttrs ( gpuvar.tech == "native") {
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NVD_BACKEND = "direct";
      WLR_NO_HARDWARE_CURSORS = "1"; # needed for sway, no effect on Hyprland
      __GL_GSYNC_ALLOWED = "1";
      __GL_VRR_ALLOWED = "1";
    } // lib.optionalAttrs (gpuvar.tech == "nvk") {
      NVK_I_WANT_A_BROKEN_VULKAN_DRIVER = "1";             # prep for nvk
      MESA_VK_VERSION_OVERRIDE = "1.3";                    # prep for nvk
    };
  };
  users.users.${uservars.name}.extraGroups = [ "video" ];
}
