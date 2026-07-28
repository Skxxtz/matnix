{ config, ... }:
{
  age.secrets.mautrixWhatsappPickle.file = "../../secrets/mautrix-whatsapp-pickle.age";
  age.secrets.mautrixWhatsappTokens.file = "../../secrets/mautrix-whatsapp-tokens.age";

  services.mautrix-whatsapp = {
    enable = true;
    settings = {
      homeserver = {
        address = "http://127.0.0.1:${toString config.matrixSite.conduitPort}";
	domain = config.matrixSite.domain;
      };

      appservice = {
        address = "http://127.0.0.1:29318";
	hostname = "127.0.0.1";
	port = 29318;
	id = "whatsapp";
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

      network = {
        displayname_template = "{{or .FullName .BusinessName .PushName .Phone}}";
	history_sync.request_full_sync = true;
	identity_change_notices = true;
      };

      environmentFile = config.age.secrets.mautrixWhatsappTokens.path;
  };
}
