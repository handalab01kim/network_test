# 1. veth 쌍 생성
sudo ip link add veth-host type veth peer name veth-docker

# 2. veth-docker 를 Docker 브리지(net-a, br-a9baeb53db4b)에 연결
sudo ip link set veth-docker master br-a9baeb53db4b
sudo ip link set veth-docker up

# 3. host 쪽 veth 인터페이스에 IP 부여 + 활성화
sudo ip addr add 172.16.100.101/24 dev veth-host
sudo ip link set veth-host up
