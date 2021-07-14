fdisk -l
read -p "要分区的硬盘:" n
read -p "硬盘分区id:" m
disk="$n"${m}
echo " n
p
1


w
" | fdisk /dev/$n && mkfs -t ext4 /dev/$n1
echo "UUID=`blkid /dev/$disk -s UUID -o value`	/data	ext4	defaults	0 0" >> /etc/fstab
chmod +x zabbix-7.sh
sh zabbix-7.sh

