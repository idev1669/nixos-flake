{ config, lib, pkgs, uservars, ... }:

{
  xdg = {
    enable = true;
    mime.enable = true;
    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    systemDirs = {
      config = [ "${config.home.homeDirectory}/.config" ];
      data = [ "${config.home.homeDirectory}/.local/share" "/usr/share" "/usr/share/applications/" "/usr/local/share/applications/" ];
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      videos = "${config.home.homeDirectory}/Videos";
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
    desktopEntries = {
      firefox = {
        name = "Firefox";
        genericName = "Web Browser";
        exec = "firefox %U";
        terminal = false;
        categories = [ "Application" "Network" "WebBrowser" ];
        mimeType = [ 
          "text/html" 
          "text/xml" 
          "x-scheme-handler/http" 
          "x-scheme-handler/https"
          "x-scheme-handler/chrome"
          "application/x-extension-htm"
          "application/x-extension-html"
          "application/x-extension-shtml"
          "application/xhtml+xml"
          "application/x-extension-xhtml"
          "application/x-extension-xht"
        ];
      };
      nomacs = {
        name = "nomacs";
        genericName = "Image Viewer";
        exec = "nomacs %U";
        terminal = false;
        categories = [ "Application" "Graphics" "Viewer" ];
        mimeType = [ 
          "image/png" 
          "image/heic"
          "image/heif"  
          "image/jpeg" 
          "image/gif" 
          "image/bmp" 
          "image/jpg" 
          "image/tiff" 
          "image/x-bmp" 
          "image/x-ico" 
        ];
      };
    };
    mimeApps = {
      enable = true;
      associations.added = {
        #images
        "image/png" = "nomacs.desktop";
        "image/jpeg" = "nomacs.desktop";
        "image/gif" = "nomacs.desktop";
        "image/bmp" = "nomacs.desktop";
        "image/jpg" = "nomacs.desktop";
        "image/tiff" = "nomacs.desktop";
        "image/x-bmp" = "nomacs.desktop";
        "image/x-ico" = "nomacs.desktop";
        "image/heic" = "nomacs.desktop";
        "image/heif" = "nomacs.desktop";
        #web
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";
        #video
        "video/mp4" = "vlc.desktop";
        "video/mov" = "vlc.desktop";
        #vscode for text etc
        "text/plain" = "code.desktop";
        "text/x-c" = "code.desktop";
        "text/x-c++" = "code.desktop";
        "text/x-c++src" = "code.desktop";
        "text/x-chdr" = "code.desktop";
        "text/x-csrc" = "code.desktop";
        "text/x-diff" = "code.desktop";
        "text/x-dsrc" = "code.desktop";
        "text/x-haskell" = "code.desktop";
        "text/x-java" = "code.desktop";
        "text/x-makefile" = "code.desktop";
        "text/x-moc" = "code.desktop";
        "text/x-pcs-gcd" = "code.desktop";
        "text/x-perl" = "code.desktop";
        "text/x-python" = "code.desktop";
        "text/x-scala" = "code.desktop";
        "text/x-scheme" = "code.desktop";
        "text/css" = "code.desktop";
        
      };
      defaultApplications = {
        #images
        "image/png" = "nomacs.desktop";
        "image/jpeg" = "nomacs.desktop";
        "image/gif" = "nomacs.desktop";
        "image/bmp" = "nomacs.desktop";
        "image/jpg" = "nomacs.desktop";
        "image/tiff" = "nomacs.desktop";
        "image/x-bmp" = "nomacs.desktop";
        "image/x-ico" = "nomacs.desktop";
        "image/heic" = "nomacs.desktop";
        "image/heif" = "nomacs.desktop";
        #web
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";
        #video
        "video/mp4" = "vlc.desktop";
        "video/mov" = "vlc.desktop";
        #vscode
        "text/plain" = "code.desktop";
        "text/x-c" = "code.desktop";
        "text/x-c++" = "code.desktop";
        "text/x-c++src" = "code.desktop";
        "text/x-chdr" = "code.desktop";
        "text/x-csrc" = "code.desktop";
        "text/x-diff" = "code.desktop";
        "text/x-dsrc" = "code.desktop";
        "text/x-haskell" = "code.desktop";
        "text/x-java" = "code.desktop";
        "text/x-makefile" = "code.desktop";
        "text/x-moc" = "code.desktop";
        "text/x-pcs-gcd" = "code.desktop";
        "text/x-perl" = "code.desktop";
        "text/x-python" = "code.desktop";
        "text/x-scala" = "code.desktop";
        "text/x-scheme" = "code.desktop";
        "text/css" = "code.desktop";
        
      };
    };
  };
}
