#!/usr/bin/env bash

cat <<-EOF >>~/.bashrc
	echo " ____       _                    _                "
	echo "|  _ \\\\  ___| |__  _   _  __ _   / \\\\   _ __  _ __  "
	echo "| | | |/ _ \\\\ '_ \\\\| | | |/ _\\\` | / _ \\\\ | '_ \\\\| '_ \\\\ "
	echo "| |_| |  __/ |_) | |_| | (_| |/ ___ \\\\| |_) | |_) |"
	echo "|____/ \\\\___|_.__/ \\\\__,_|\\\\__, /_/   \\\\_\\\\ .__/| .__/ "
	echo "                        |___/        |_|   |_|    "
	echo "                                  "
	echo "Welcome to DebugApp Testing Centre"
	echo ""
	echo "Simple HTTP server is listening on the port you specified (default: 80)"
	echo ""
EOF

/bin/debugapp -port ${DEBUGAPP_PORT:-80}
