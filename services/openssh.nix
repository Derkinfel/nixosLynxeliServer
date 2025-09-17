{
  services.openssh = {
    enable = true;
    permitRootLogin = true;
    ports = [ 22 ];
  };
}
