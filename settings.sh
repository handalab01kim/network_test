# 라우팅 설정

# router a
docker exec router_a ip route add 172.16.200.0/24 via 172.16.50.2
# router b
docker exec router_b ip route add 172.16.0.0/24 via 172.16.50.1
docker exec router_b ip route add 172.16.200.0/24 via 172.16.51.2
# router c
docker exec router_c ip route add 172.16.0.0/24 via 172.16.51.1
# default gateway
# pc a
docker exec pc_a ip route del default || true
docker exec pc_a ip route add default via 172.16.0.1
# pc c
docker exec pc_c ip route del default || true
docker exec pc_c ip route add default via 172.16.200.1



# 포워딩 허용; host pc에서 1회만 실행
sudo sysctl -w net.ipv4.ip_forward=1

# NAT X
# docker exec router_b iptables -t nat -A POSTROUTING -s 172.16.200.0/24 -o eth0 -j MASQUERADE

