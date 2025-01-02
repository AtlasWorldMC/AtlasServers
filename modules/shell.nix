{ pkgs, pkgs-unstable, ... }: 

{
  users.defaultUserShell = pkgs.fish;

  programs.fish = {
    enable = true;
    shellInit = ''
      set fish_greeting

      zoxide init fish | source
      atuin init fish | source
    '';
  }; 

  environment.systemPackages = with pkgs; [
    
    # QoL improvements
    atuin
    zoxide
    fastfetch

    # Utilities
    nano
    wget
    curl
    tree
    git
    unzip
    zip
    xz
    p7zip

    # Monitoring
    btop
    htop
  ];
}
