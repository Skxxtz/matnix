{ pkgs, ... }:
{
  boot.loader.timeout = 3;
  nixpkgs.hostPlatform = "aarch64-linux";
  nixpkgs.config.permittedInsecurePackages = [ "olm-3.2.16" ];

  zramSwap = {
    enable = true;
    memoryPercent = 100
  };

  services.journald.extraConfig = ''
    SystemMaxUser=100M
  '';

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [ neovim git htop tmux curl ];

  system.stateVersion = "25.11";
}

