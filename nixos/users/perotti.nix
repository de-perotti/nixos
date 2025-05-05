{ ... }:
{
    users.users.perotti.isNormalUser = true;
    users.users.perotti.extraGroups = [
        "wheel" # Enable sudo
    ];
}
