# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;

  networking.hostName = "odinsbeard"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.x11 = true;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
    windowManager.bspwm = {
       enable = true;
       configFile = "/home/odin/dotfiles/bspwmrc";
       sxhkd.configFile = "/home/odin/dotfiles/sxhkdrc";
    };
    displayManager.auto = {
       enable = true;
       user = "odin";
    };
    desktopManager.default = "none";
    desktopManager.xterm.enable = false;
    autoRepeatDelay = 200;
    autoRepeatInterval = 25;
    libinput.enable = true;
    resolutions = [
       { x = 1920; y = 1080; }
    ];
  };

  services.compton = {
      enable = true;
      shadow = true;
      inactiveOpacity = "0.8";
  };

  services.fstrim.enable = true;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.odin = {
    isNormalUser = true;
    home = "/home/odin";
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" ];
    uid = 1001;
  };

  home-manager.users.odin = {
    home.file.".config/bspwm/bspwmrc".source = "/home/odin/dotfiles/bspwmrc";
    home.file.".config/sxhkd/sxhkdrc".source = "/home/odin/dotfiles/sxhkdrc";
    home.packages = [
       pkgs.fortune
    ];
    services.random-background = { enable = true; imageDirectory = "/home/code/dotfiles/wallpapers"; };
  };

  programs.fish.enable = true;

  fonts.fonts = with pkgs; [
    hack-font
    siji
  ];

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?
}
