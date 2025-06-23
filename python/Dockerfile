FROM python:3
RUN apt update && apt install -y iproute2 iputils-ping net-tools curl
CMD ["python3", "-m", "http.server", "80"]
