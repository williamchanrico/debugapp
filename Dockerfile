FROM alpine:3.9
LABEL maintainer="William Chanrico <williamchanrico@gmail.com>"


RUN apk update && apk add --no-cache \
	openssh \
	bash \
	ca-certificates \
	sudo \
	jq \
	vim \
	git \
	wget \
	curl \
	bind-tools \
	python \
	py-pip \
	tcpdump \
	iputils \
	unzip \
	tmux \
	iproute2 \
	netcat-openbsd \
	redis \
	postgresql-client \
	net-tools \
	busybox-extras \
	mysql-client \

    # Configure ssh using 'root' user with password 'root'
	&& sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
	&& echo "root:root" | chpasswd \
	&& rm -rf /var/cache/apk/* \
	&& sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config \
	&& sed -ri 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config \
	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config \
	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config \
	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config \
	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config \
	&& /usr/bin/ssh-keygen -A \
	&& ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key -N ""

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Custom stand-alone binaries
COPY bin/httpstat-v1.0.0 /usr/local/bin/httpstat
COPY bin/grpcurl-v1.4.0 /usr/local/bin/grpcurl
COPY bin/debugapp /usr/local/bin/debugapp

WORKDIR /root

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["--http-port", "80", "--https-port", "443"]
