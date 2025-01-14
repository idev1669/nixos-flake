{ inputs
, ...
}:
{
  mkSyst = { 
    hostname,
    envir,
    curversion ? "25.05",
    desk ? "desktop",
    bootloader ? ({
      type = "opencore";
      defconf = true;
      timeout = 10;
      device = "nodev";
    }),
    gpuvar ? ({
      type = "nvidia";
      tech = "prime";
      busd = "PCI:01:00:0"; # lspci -nn | grep VGA
      busi = "PCI:00:02:0";
      port = "tbqhd";
    }),
    system ? "x86_64-linux",
    cpuvar ? ({
      type = "intel";
      hasIntegrated = false;
      integratedBroken = false;
    }),
    colorsvar ? "gruvbox-dark",
    brightnesctrl ? ({
      up = "ddcutil setvcp 10 + 5";
      down = "ddcutil setvcp 10 - 5";
    }),
    uservars ? ({
      name = "user";
      description = "id3v1669";
      owner = "id3v1669";
      domain = "none";
      wp = "default3.png";
      sleeptimeout = 1200;
    }),
    deflocale ? ({
      kblayout = "us,ru";
      kbvariant = ",";
      kboption = "grp:win_space_toggle";
      timezone = "Australia/Perth";
      locale = "en_AU.UTF-8";
    })
  }:
  let
    stable = import inputs.nixpkgs-stable {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    pkgs = import inputs.nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
      overlays = 
      [
        inputs.nur.overlays.default
        inputs.eww.overlays.default
        inputs.hyprpicker.overlays.default
        inputs.nix-minecraft.overlay
        inputs.hyprland.overlays.default
        (final: prev: {
          dynamic-color-gtk-theme = inputs.dcgt.packages.${prev.system}.default;                              # custom theme(unfinished)
          eww = inputs.eww.packages.${prev.system}.eww.override {cudaSupport = (gpuvar.type == "nvidia" && gpuvar.tech != "nvk");}; 
                                                                                                              # eww overlay with nviia tempratures support
          over-btop = (import ./../overlays/btop.nix { inherit pkgs gpuvar cpuvar; });                        # btop overlay for gpu support
          over-libratbag = (import ./../overlays/libratbag.nix { inherit pkgs; });                            # libratbag overlay with asus rog pugio ii config
          over-lutris = (import ./../overlays/lutris.nix { inherit pkgs; });                                  # lutris overlay with extra packages
          over-gruvbox-plus-icons = (import ./../overlays/gruvbox-plus-icons.nix { inherit pkgs; });          # gruvbox-plus-icons overlay with symlinks for symbolic icons
          over-steam = (import ./../overlays/steam.nix { inherit pkgs; });                                    # steam overlay with extra packages
          over-equibop = (import ./../overlays/equibop.nix { inherit pkgs; });                                # equibob overlay
          over-rofi-calc = (import ./../overlays/rofi-calc.nix { inherit pkgs; });                            # rofi-calc overlay as package has non-wayland build input
          over-rofi-emoji = (import ./../overlays/rofi-emoji.nix { inherit pkgs; });                          # rofi-emoji overlay as package has non-wayland build input
          over-opencore = (prev.callPackage ./../overlays/opencore.nix {});                                   # opencore bootloader files as official repo doesn't have it (later create module)
          #--------------------------------------------------------------------------------------
        })
      ];
    };
    allSpecialArgs = {
      inherit 
        inputs
        stable
        hostname
        envir
        curversion
        desk
        bootloader
        gpuvar
        system
        cpuvar
        colorsvar
        brightnesctrl
        uservars
        deflocale;
    };
  in
  inputs.nixpkgs.lib.nixosSystem {
    inherit pkgs;
    specialArgs = allSpecialArgs;
    modules = [
      (./.. + "/hosts/${hostname}")
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.swhkd.nixosModules.default
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${uservars.name} = import (./.. + "/home/home.nix") ;
          extraSpecialArgs = allSpecialArgs;
        };
      }
    ];
  };
}
