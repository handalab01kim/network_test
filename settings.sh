# 1. 라우팅 설정
# router_a: net-b 대역(172.16.200.0/24)로 가는 경로 설정 (via router_b)
docker exec router_a ip route add 172.16.200.0/24 via 172.16.1.3

# router_b에서 pc_b 경로는 이미 연결됨
# pc_b에서 기본 게이트웨이(router_b)로 설정
docker exec pc_b ip route del default
docker exec pc_b ip route add default via 172.16.200.2



# 2. router a, b 포워딩 허용
# ubuntu pc에서 1회만 실행
sudo sysctl -w net.ipv4.ip_forward=1
# docker exec router_a sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
# docker exec router_b sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"


# 3. router b NAT 설정 (b의 pc 외부에 노출)
docker exec router_b iptables -t nat -A POSTROUTING -s 172.16.200.0/24 -o eth0 -j MASQUERADE

