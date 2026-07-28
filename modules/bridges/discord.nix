{ config, ... }:
{
  age.secrets.mautrixDiscordTokens.file = ../../secrets/mautrix-discord-tokens.age;

  services.mautrix-discord = {
    enable = true;
    environmentFile = config.age.secrets.mautrixDiscordTokens.path;
    settings = {
      homeserver = {
        address = "http://127.0.0.1:${toString config.matrixSite.conduitPort}";
        domain = config.matrixSite.domain;
      };

      appservice = {
        address = "http://127.0.0.1:29319";
        hostname = "127.0.0.1";
        port = 29319;
        id = "discord";
        database = {
          type = "sqlite3-fk-wal";
          uri = "/var/lib/mautrix-discord/mautrix-discord.db";
        };

        as_token = "$DISCORD_AS_TOKEN";
        hs_token = "$DISCORD_HS_TOKEN";
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
