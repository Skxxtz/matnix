{ config, ... }:
let 
  tunnel_id = "91bd93e3-b244-409a-9798-10ffdb9a95a7";
in
{
  services.cloudflared = {
    enable = true;
    tunnels."${tunnel_id}" = {
      credentialsFile = "/root/.cloudflared/${tunnel_id}.json";
      default = "http_status:404";
      ingress."${config.matrixSite.domain}" = "http://127.0.0.1:${toString config.matrixSite.conduitPort}";
    };
  };
}
