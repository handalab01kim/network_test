
######

#!! 테스트
# A 라우터에서 pc_b 서버로 curl
docker exec router_a wget -O- http://172.16.200.3:80

# or
# host에서 router_a를 통해 router_b → pc_b로 가는 트래픽 경유 시 확인용
# 포트 열림 확인
docker exec pc_b netstat -tnlp


