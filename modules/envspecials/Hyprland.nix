{ config
, pkgs
, inputs
, gpuvar
, lib
, ...
}: 
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];
  services = {
    xserver.desktopManager.gnome.enable = true;
  };
  environment.gnome.excludePackages = with pkgs; [ ];
  programs.hyprland.enable = true;
  environment.etc = {} // lib.optionalAttrs (gpuvar.type == "nvidia") {
    "nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.txt".text = ''
{
  "rules": [
    {
      "pattern": {
        "feature": "procname",
        "matches": "Hyprland"
      },
      "profile": "LimitFreeBufferPool"
    }
  ],
  "profiles": [
    {
      "name": "LimitFreeBufferPool",
      "settings": [
        {
          "key": "GLVidHeapReuseRatio",
          "value": 1
        }
      ]
    }
  ]
}
    ''; 
  };
}