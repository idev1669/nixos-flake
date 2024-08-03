{ uservars
, curversion
, ...
}:
{
  imports = [ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    #./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/sudo.nix
    ./../../modules/swhkd.nix
    ./../../modules/bluetooth.nix
  ];
  
  networking.firewall.enable = false;
  users.users.${uservars.name}.extraGroups = [
    "wheel"
    "networkmanager"
    "rustdesk"
    "adbusers"
    "input" 
    "disk"
    "wireshark"
    "i2c"
    "veracrypt"
    "usbmux"
  ];
  environment.variables = {
    #system vars
    EDITOR = "nano";
  };
  system.stateVersion = "${curversion}";
}