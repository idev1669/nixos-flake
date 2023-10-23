{ config, lib, pkgs, hostname, ... }:
{
  imports = [ 
    #(./. + "/hostsettings/${hostname}.nix")
    ./dynamic-color-theme
  ];
  gtk = {
    enable = true;
    theme = {
      name = "dynamic-color-theme";
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  };
}