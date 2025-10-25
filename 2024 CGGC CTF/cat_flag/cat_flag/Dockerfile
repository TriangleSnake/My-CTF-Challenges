FROM mcr.microsoft.com/powershell:lts-debian-11

RUN apt-get update && apt-get install -y \
    openssl \
    python3 \
    xinetd \
    iptables \
    && apt-get clean

RUN adduser user 

RUN update-alternatives --set iptables /usr/sbin/iptables-legacy

COPY ./chal.sh /root/

CMD ["/usr/sbin/xinetd", "-dontfork"]
