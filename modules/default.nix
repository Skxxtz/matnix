{...}:
{
  imports = [
    ./options.nix
    ./system.nix
    ./networking.nix
    ./users.nix
    ./conduit.nix
    ./cloudflared.nix

    ./bridges/whatsapp.nix
    ./bridges/discord.nix
    ./bridges/instagram.nix
  ];
}
