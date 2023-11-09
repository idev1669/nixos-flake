{lib, config, pkgs, uservars, ...}:
{
  environment.etc."nextcloud-admin-pass".text = "test123";
  networking.interfaces.ens3.ipv4.addresses = [
    { address = "77.91.123.39"; prefixLength = 24; }
    { address = "77.91.123.50"; prefixLength = 24; }
  ];
  networking.defaultGateway = "77.91.123.1";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  #networking.firewall.allowedTCPPorts = [ 22 80 443 8080 8090 28943 ];
  networking.firewall.enable = false;
  security.acme = {
    defaults.email = "nico@nico.ni";
    acceptTerms = true;
  };
  services = {
    nextcloud = {
      enable = true;
      package = pkgs.nextcloud27;
      database.createLocally = true;
      https = true;
      nginx.hstsMaxAge = 31536000;
      configureRedis = true;
      webfinger = true;
      maxUploadSize = "10G";
      hostName = "nextcloud.id3v1669.com";
      autoUpdateApps = {
        enable = true;
        startAt = "Sun 14:00:00";
      };
      extraApps = with config.services.nextcloud.package.packages.apps; {
        inherit calendar contacts mail notes onlyoffice tasks;
      };
      config = {
        dbtype = "mysql";
        overwriteProtocol = "https";
        defaultPhoneRegion = "AU";
        adminuser = "admin-root";
        adminpassFile = "/etc/nextcloud-admin-pass";
        extraTrustedDomains = [ "nextcloud.id3v1669.com" ];
      };
    };
    nginx = {
      enable = true;
      virtualHosts = {
        "nextcloud.id3v1669.com" = {
          enableACME = true;
          forceSSL = true;
        };
        "onlyoffice.id3v1669.com" = {
          enableACME = true;
          forceSSL = true;
        };
      };
    };
    mysql.package = lib.mkForce pkgs.mariadb;
    onlyoffice = {
      enable = true;
      hostname = "onlyoffice.id3v1669.com";
    };

  };
}