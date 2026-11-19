#!/bin/sh
# command-chain for every app (and `snap run --shell`): sets up the
# environment, then execs the real command.

# TODO maybe move all of this to /etc/environment or to the environment key on the snap

export PATH="$SNAP/usr/lib/rabbitmq/bin:$SNAP/usr/lib/erlang/bin:$SNAP/usr/bin:$PATH"

RABBITMQ_ETC="$SNAP_DATA/etc/rabbitmq"
export RABBITMQ_CONFIG_FILE="$RABBITMQ_ETC/rabbitmq"
export RABBITMQ_CONFIG_FILES="$RABBITMQ_ETC/conf.d"
export RABBITMQ_ADVANCED_CONFIG_FILE="$RABBITMQ_ETC/advanced.config"
export RABBITMQ_CONF_ENV_FILE="$RABBITMQ_ETC/rabbitmq-env.conf"
export RABBITMQ_ENABLED_PLUGINS_FILE="$RABBITMQ_ETC/enabled_plugins"
export RABBITMQ_MOTD_FILE="$RABBITMQ_ETC/motd"

# Like the deb's rabbitmq user, HOME is the data dir and holds the erlang cookie.
export HOME="$SNAP_COMMON/var/lib/rabbitmq"
export RABBITMQ_MNESIA_BASE="$HOME/mnesia"
export RABBITMQ_LOG_BASE="$SNAP_COMMON/var/log/rabbitmq"
export ERL_CRASH_DUMP="$RABBITMQ_LOG_BASE/erl_crash.dump"
export RABBITMQ_NODENAME="${RABBITMQ_NODENAME:-rabbit@localhost}"

exec "$@"
