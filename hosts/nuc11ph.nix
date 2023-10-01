{ config, lib, pkgs, modulesPath, gpuvar, ... }:
{
  imports =
    [ 
      (modulesPath + "/installer/scan/not-detected.nix")
      ./configuration
    ];

  boot = {
    kernelModules = [ "kvm-intel" "i2c-dev" "i2c-piix4" ];
    kernelParams = [ ]; #"i915.modeset=1" ]; #"module_blacklist=i915" ];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback config.boot.kernelPackages.nvidia_x11 ];
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ ];
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/f6b97720-d8d6-4cbf-9300-b0d603fd1178";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D8D4-A961";
      fsType = "vfat";
    };

  swapDevices = [ ];


}
