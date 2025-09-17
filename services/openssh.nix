{
  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
    ports = [ 22 ];
  };
}
