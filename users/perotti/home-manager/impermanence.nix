{ ... }: {
  home.persistence."/persistent/home/perotti" = {
    directories = [
      "Downloads"
      "code"
      ".gnupg"
      ".ssh"
      ".nixops"
      ".local/share/keyrings"
    ];
    allowOther = true;
  };
}
