FROM alpine:3.9

RUN apk update && apk add --no-cache \
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
	busybox-extras

COPY entrypoint.sh .
COPY bin/install-to-container/httpstat /bin/
COPY bin/debugapp /bin/debugapp

ENTRYPOINT ["./entrypoint.sh"]
