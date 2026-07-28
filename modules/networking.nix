{ ... }:
{
  networking.hostName = "matrix";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = []; # 25 if Postmoogle ends up in the config
}
