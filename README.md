lsblk # search for the drive to install nixos on 
###### example output:
[root@nixos:/mnt/etc/nixos]# lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0         7:0    0   1.4G  1 loop /nix/.ro-store
sda           8:0    0   1.8T  0 disk 
├─sda1        8:1    0   500M  0 part 
└─sda2        8:2    0   1.8T  0 part 
sdb           8:16   1  57.3G  0 disk 
├─sdb1        8:17   1  57.3G  0 part 
│ └─ventoy  254:0    0   1.5G  1 dm   /iso
└─sdb2        8:18   1    32M  0 part 
nvme0n1     259:0    0 232.9G  0 disk 
├─nvme0n1p1 259:5    0   500M  0 part /mnt
└─nvme0n1p2 259:6    0 232.4G  0 part /mnt/boot

###### put there drive name instead of CHANGE_DRIVE_NAME
drive="CHANGE_DRIVE_NAME" # usually it's either sda or nvme0n1
###### put there partition names instead of CHANGE_TO_PARTITION_X
bootPartition="CHANGE_TO_PARTITION_1" # usually either sda1 or nvme0n1p1
rootPartition="CHANGE_TO_PARTITION_2" # usually either sda2 or nvme0n1p2

mkfs.fat -F 32 "/dev/$drive"
fatlabel "/dev/$bootPartition" NIXBOOT
mkfs.ext4 "/dev/$rootPartition" -L NIXROOT

mount "/dev/$rootPartition" /mnt
mkdir /mnt/boot
mount "/dev/$bootPartition" /mnt/boot
nixos-generate-config --root /mnt

cd /mnt/etc/nixos/
git clone https://github.com/derkinfel/nixosLynxeliServer
mv ./configuration.nix ./nixosLynxeliServer
mv ./hardware-configuration.nix ./nixosLynxeliServer
