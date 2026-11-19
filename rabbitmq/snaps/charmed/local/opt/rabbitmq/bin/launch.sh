#!/bin/sh
set -e

# Run the broker as the snap's _daemon_ user, as the deb does with its rabbitmq user.
exec "$SNAP/usr/bin/setpriv" \
    --clear-groups \
    --reuid _daemon_ \
    --regid _daemon_ -- \
    "$SNAP/usr/lib/rabbitmq/bin/rabbitmq-server"
