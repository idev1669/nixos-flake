{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, ...}: 
{
  programs = {
    adb.enable = true;
    fish.enable = true;
    dconf.enable = true;
  } // lib.optionalAttrs (envir == "gnome") {
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  } // lib.optionalAttrs (envir == "hypr") {
    regreet.enable = true;
  };
  environment = {
    systemPackages = (with pkgs; [
      fish
      catppuccin-sddm-corners
      sddm-chili-theme
    ]) ++ lib.lists.optionals (envir == "hypr") (with pkgs; [
      polkit_gnome
      xorg.xhost
    ]);
  } // lib.optionalAttrs (envir == "gnome") {
    gnome.excludePackages = (with pkgs; [
    gnome-tour
    ]) ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      gnome-terminal
      epiphany # web browser
      geary # email reader
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
    ]);
  };
}
