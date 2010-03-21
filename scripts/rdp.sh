# Convenience wrapper around rdesktop
geo="1280x750"
if [ -n "$1" ]; then
	echo "Info: Hostname: $1"
else
	echo "Error: Hostname not specified"
	echo "Usage: rdp <hostname> <geometry> <optional non-console>"
	echo "E.g. rdp foo.bar.com 1024x768 1"
	exit
fi
if [ -n "$2" ]; then
	echo "Info: Setting geometry to $2"
	geo=$2
else
	echo "Warn: Geometry not set, defaulting to $geo"
fi
if [ -n "$3" ]; then
	echo "Info: Not using console Session ID"
	title="-T $1 (non-console)"
  sessionid="-5"
else
	echo "Info: Session ID defaulting to console"
  title="-T $1 (console)"
  sessionid="-0"
fi
rdesktop "$title" "$sessionid" -g "$geo" -a 16 -r clipboard:CLIPBOARD "$1" &
