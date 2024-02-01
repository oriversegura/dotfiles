# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  programs.hyprland.enable = true;
  hardware.bluetooth.enable = true; 
  programs.nm-applet.enable = true;
  programs.waybar.enable = true; 
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
  thunar-archive-plugin
  thunar-volman
  ];

   # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Optiplex7040"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  # Set your time zone.
  time.timeZone = "America/Santo_Domingo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_DO.UTF-8";
    LC_IDENTIFICATION = "es_DO.UTF-8";
    LC_MEASUREMENT = "es_DO.UTF-8";
    LC_MONETARY = "es_DO.UTF-8";
    LC_NAME = "es_DO.UTF-8";
    LC_NUMERIC = "es_DO.UTF-8";
    LC_PAPER = "es_DO.UTF-8";
    LC_TELEPHONE = "es_DO.UTF-8";
    LC_TIME = "es_DO.UTF-8";
  };


  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "altgr-intl";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.osegura = {
    isNormalUser = true;
    description = "OriverSegura";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
  neofetch
  neovim
  git
  wget
  curl
  rofi
  hyprpicker
  google-chrome
  vscode
  dotnet-sdk_8
  go
  thunderbird
  spotify
  anydesk
  wlr-randr
  wireplumber
  pavucontrol
  nmap
  rustscan
  alacritty
  dunst
  nwg-look
  wf-recorder
  wlogout
  wlsunset   
  telegram-desktop
  appimage-run
  ipmitool
  tmux
  librewolf
  openssh
  remmina
  vlc
  feh
  hyprpaper
  wl-clipboard
  slurp
  grim
  bitwarden	
  swaylock-effects
  swayidle
  winbox
  gh
  ];

  };

  
  # Enable automatic login for the user.
  # services.getty.autologinUser = "osegura";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  vim 
  tailscale
  gcc
  sddm-chili-theme
  nodejs_21
  python3
  python311Packages.pip
  python311Packages.requests
  ];
  
  # Fotns
  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];

  # Autentication Swaylock
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  
  # SDDM Theme Chili Active
  services.xserver.displayManager.sddm.theme = "chili";
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.xserver.enable =true;
  services.xserver.displayManager.sddm.enable = true; 
  services.tailscale.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true; 
  services.udisks2.enable = true;


  #Audio
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;
  };

  # Security 
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [22];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;
  networking.firewall.allowPing = false;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
