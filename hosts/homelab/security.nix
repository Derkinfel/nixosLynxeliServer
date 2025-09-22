{
  users.users.root.initialPassword = "1234";
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 
    22
    443
  ];
}
