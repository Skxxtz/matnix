{ config, ... }:
{
  services.matrix-conduit = {
    enable = true;
    settings.global = {
      server_name = config.matrixSite.domain;
      address = "127.0.0.1";
      port = config.matrixSite.conduitPort;
      database_backend = "rocksdb";
      allow_registration = false;
      allow_federation = false;
      allow_check_for_updates = false;
      trusted_servers = [ "matrix.org" ];
    };
  };
}
