{
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
    device = "nodev";
  };
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub.enable = false;
  # boot.loader.efi.efiSysMountPoint = "/boot";
  services.openssh.enable = true;
  services.qemuGuest.enable = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXROOT";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  };
  networking.useDHCP = false;
  networking.interfaces.ens3.ipv4.addresses = [
    {
      address = "212.192.246.121";
      prefixLength = 32;  # or whatever netmask/prefix they gave you
    }
  ];
  networking.interfaces.ens3.ipv4.routes = [
    {
      address = "10.0.0.1";
      prefixLength = 32;
    }
  ];
  networking.defaultGateway = "10.0.0.1"; # ← also provided by Waicore
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  users.users.root.initialPassword = "1234";
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII1L8VjHuoBFnWefgi+q+HFeIsrh1rBtkOLDohjNcmI4 derkinfel@nixos"
  ]; # this is used for unit-testing this module and can be removed if not needed

  system.stateVersion = "25.05";
}
