FROM debian:bullseye

# 필수 도구 설치
RUN apt update && \
    apt install -y iproute2 iptables iputils-ping curl net-tools wget && \
    apt clean

# 기본 명령: 종료되지 않도록 대기
CMD ["sh", "-c", "sleep infinity"]
