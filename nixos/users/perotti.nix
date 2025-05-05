{ config, ... }:
{
    users.users.perotti = {
        isNormalUser = true;
        extraGroups = [
            "wheel" # Enable sudo
        ];
    };
}
