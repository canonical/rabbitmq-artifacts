#!/bin/sh
set -e

# Runs the CLI tool named by $bin_script. As root, drop to _daemon_ so the tool
# can read the owner-only erlang cookie, like the deb's rabbitmq-script-wrapper.
cmd="$SNAP/usr/lib/rabbitmq/bin/$bin_script"

if [ "$(id -u)" -eq 0 ]; then
    exec "$SNAP/usr/bin/setpriv" \
        --clear-groups \
        --reuid _daemon_ \
        --regid _daemon_ -- \
        "$cmd" "$@"
fi

exec "$cmd" "$@"
