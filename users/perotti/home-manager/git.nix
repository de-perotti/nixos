{ ... }: {
  programs.git.enable = true;
  programs.git.userName = "de-perotti";
  programs.git.userEmail = "perottilds@gmail.com";
  programs.git.extraConfig = {
    init.defaultBranch = "main";
    push.autoSetupRemote = true;
  };
}
