{
	virtualisation = {
		docker = {
			enable = true;
			enableOnBoot = true;
			daemon.settings = {
      	"data-root" = "/var/lib/docker";
      	"storage-driver" = "overlay2";   # change to "zfs" or "btrfs" if needed
      	"exec-opts" = [ "native.cgroupdriver=systemd" ];
    	};
		};
	};
}
