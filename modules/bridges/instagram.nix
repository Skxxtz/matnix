{ config, ... }:
{
  age.secrets.mautrixInstagramTokens.file = ../../secrets/mautrix-instagram-tokens.age;

  services.mautrix-meta.instances.instagram = {
    enable = true;
    environmentFile = config.age.secrets.mautrixInstagramTokens.path;
    settings = {
      network.mode = "instagram";

      homeserver = {
        address = "http://127.0.0.1:${toString config.matrixSite.conduitPort}";
        domain = config.matrixSite.domain;
      };

      appservice = {
        address = "http://127.0.0.1:29320";
        hostname = "127.0.0.1";
        port = 29320;
        id = "instagram";
        as_token = "$INSTAGRAM_AS_TOKEN";
        hs_token = "$INSTAGRAM_HS_TOKEN";

        database = {
          type = "sqlite3-fk-wal";
          uri = "/var/lib/mautrix-meta-instagram/mautrix-meta.db";
        };
      };

      bridge.permissions = {
        "${config.matrixSite.domain}" = "user";
        "@admin:${config.matrixSite.domain}" = "admin";
      };

      bridge.encryption = {
        allow = true;
        default = true;
        self_sign = true;
      };
    };
  };
}
