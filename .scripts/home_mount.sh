sudo mount pve.home:/mnt/nvme/homedirs/kdb424/Downloads /home/kdb424/Downloads -t nfs -o rw,_netdev,noatime
sudo mount pve.home:/mnt/nvme/homedirs/kdb424/.kodi /home/kdb424/.kodi -t nfs -o rw,_netdev,noatime
sudo mount pve.home:/mnt/nvme/homedirs/kdb424/Bitwig\ Studio /home/kdb424/Bitwig\ Studio -t nfs -o rw,_netdev,noatime
sudo mount pve.home:/mnt/nvme/homedirs/kdb424/.BitwigStudio /home/kdb424/.BitwigStudio -t nfs -o rw,_netdev,noatime
sudo mount pve.home:/mnt/nvme/homedirs/kdb424/Futurama /home/kdb424/Futurama -t nfs -o rw,_netdev
sudo mount pve.home:/mnt/6tb /mnt/6tb -t nfs4 -o rw,_netdev,fsc,noatime
