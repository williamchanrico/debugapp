#!/usr/bin/env bash

printf "cat /etc/motd\n\n" >>/root/.bashrc

cat <<-EOF >/etc/motd
	     _      _
	  __| | ___| |__  _   _  __ _  __ _ _ __  _ __
	 / _' |/ _ \\ '_ \\| | | |/ _' |/ _' | '_ \\| '_ \\
	| (_| |  __/ |_) | |_| | (_| | (_| | |_) | |_) |
	 \\__,_|\\___|_.__/ \\__,_|\\__, |\\__,_| .__/| .__/
	                        |___/      |_|   |_|
	Welcome to DebugApp!
	--------------------

	Simple HTTP and HTTPS server are served for debugging purposes

EOF

# Enable ssh daemon on 'root' user using password 'root'
if [ -n "$DEBUGAPP_ENABLE_SSH" ]; then
	cat <<-EOF >>/etc/motd
		SSH Daemon server has been enabled. You can access this container
		via SSH on root user using 'root' as the password.

	EOF
	/usr/sbin/sshd
fi

CUSTOM_BINARIES=$(ls -1 /usr/local/bin | grep -v "entrypoint.sh")
printf "Custom installed binaries in /usr/local/bin below:\n%s\n\n" "$CUSTOM_BINARIES" >>/etc/motd

exec /usr/local/bin/debugapp "$@"
