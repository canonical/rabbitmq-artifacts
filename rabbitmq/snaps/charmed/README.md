# RabbitMQ Charmed Snap
[![Publish artifacts](https://github.com/canonical/rabbitmq-artifacts/actions/workflows/publish.yaml/badge.svg)](https://github.com/canonical/rabbitmq-artifacts/actions/workflows/publish.yaml)
    
This repository contains the packaging metadata for creating a snap of rabbitmq. 
For more information on snaps, visit [snapcraft.io](https://snapcraft.io/). 

## Installing the Snap
The snap can be installed directly from the Snap Store. Follow the link below for more information.
<br>

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/rabbitmq-charmed)

```bash
sudo snap install rabbitmq-charmed --edge
```

## Interaction with the snap
By default, the snap installs with all services disabled. Start the
rabbitmq-server explicitly, then connect to it via cli:

```bash
sudo snap start rabbitmq-charmed.server
rabbitmq-charmed.diagnostics ping
```

Other available commands can be found here: `snap info rabbitmq-charmed`


## Building the Snap
### Clone Repository
```bash
git clone git@github.com:canonical/rabbitmq-artifacts.git
cd rabbitmq-artifacts/rabbitmq/snaps/charmed
```
### Installing and Configuring Prerequisites
```bash
sudo snap install snapcraft --classic
sudo snap install lxd
sudo lxd init --auto
```
### Packing and Installing the Snap
```bash
snapcraft pack
sudo snap install ./rabbitmq-charmed*.snap --dangerous
```

Use `--dangerous` to skip signature verification for a locally built snap.
`--devmode` is also acceptable while iterating, and additionally relaxes
confinement so you don't need to connect interfaces manually — but it
disables confinement checks entirely, so don't use it to validate the final
`strict` confinement behaviour.

## Testing the Snap
This variant ships a [spread](https://github.com/canonical/spread) suite
covering some apps, run against a real `craft` (LXD) backend on `ubuntu-26.04`:

```bash
snapcraft test
```

## License
The RabbitMQ Charmed Snap is free software, distributed under the Apache
Software License, version 2.0. See
[LICENSE](https://github.com/canonical/rabbitmq-artifacts/blob/main/LICENSE)
for more information.