let
  admin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP2LH9HZROEKYegk+IwJoNqVId5sk0SC6WbJ/S8tYnXu";
  host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKFEp1vYlZ6MNwnht6exWy2Ge5Jrl5A+dfzBhiei13w5";
  allKeys = [ admin host ];
in
{
  "mautrix-whatsapp-pickle.age".publicKeys = allKeys;
  "mautrix-whatsapp-tokens.age".publicKeys = allKeys;
  "mautrix-discord-tokens.age".publicKeys = allKeys;
  "mautrix-instagram-tokens.age".publicKeys = allKeys;
}
