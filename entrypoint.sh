#!/usr/bin/env bash

cat <<-EOF >>~/.bashrc
	echo " ____       _                    _                "
	echo "|  _ \\\\  ___| |__  _   _  __ _   / \\\\   _ __  _ __  "
	echo "| | | |/ _ \\\\ '_ \\\\| | | |/ _\\\` | / _ \\\\ | '_ \\\\| '_ \\\\ "
	echo "| |_| |  __/ |_) | |_| | (_| |/ ___ \\\\| |_) | |_) |"
	echo "|____/ \\\\___|_.__/ \\\\__,_|\\\\__, /_/   \\\\_\\\\ .__/| .__/ "
	echo "                        |___/        |_|   |_|    "
	echo "                                  "
	echo "Welcome to DebugApp!"
	echo ""
	echo "Simple HTTP and HTTPS server are served for debugging purposes"
	echo ""
EOF

exec /bin/debugapp \
	--http-port ${DEBUGAPP_HTTP_PORT:-80} \
	--https-port ${DEBUGAPP_HTTPS_PORT:-443}
