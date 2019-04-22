FROM alpine:3.9

RUN apk update && apk add --no-cache \
	ca-certificates \
	bash \
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
	mysql-client

COPY entrypoint.sh .
COPY bin/install-to-container/httpstat /bin/httpstat
COPY bin/debugapp /bin/debugapp

WORKDIR /root
ENTRYPOINT ["/entrypoint.sh"]
