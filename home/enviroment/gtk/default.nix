{ config, lib, pkgs, hostname, ... }:
{
  imports = [ 
    #(./. + "/hostsettings/${hostname}.nix")
    ./dynamic-color-theme
    #./dynamic-color-theme/assets
  ];
  gtk = {
    enable = true;
    theme = {
      name = "Dracula2";
      #package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    # gtk3.extraCss = ''
    #   ${gtkcss}
    # '';
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    # gtk4.extraCss = ''
    #   ${gtkcss}
    # '';
  };
}