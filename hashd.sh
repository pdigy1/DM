#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- https://raw.githubusercontent.com/pdigy1/DM/master/hashd.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='hashplatform/HASH'
# Display Name.
DAEMON_NAME='Hash Core'
# Coin Ticker.
TICKER='HASH'
# Binary base name.
BIN_BASE='hash'
# Directory.
DIRECTORY='.hash'
# Conf File.
CONF='hash.conf'
# Port.
DEFAULT_PORT=4188
# Explorer URL
EXPLORER_URL='https://explorer.hashplatform.org'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=60000
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1

ASCII_ART () {
echo -e "\\e[0m"
clear 2> /dev/null
cat << "HASH"


HASH
}

# Tip Address
#TIPS='sd8Jov5QZFSc7vrjmNV7Zx6muzpeCpiJLL'
# Dropbox Addnodes
#DROPBOX_ADDNODES='o0u8ti5v3l4nbkw'
# If set to 1 then use addnodes from dropbox.
#USE_DROPBOX_ADDNODES=0
# Dropbox Bootstrap
#DROPBOX_BOOTSTRAP='tp13jpvluvrdqn4'
# If set to 1 then use bootstrap from dropbox.
#USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
#DROPBOX_BLOCKS_N_CHAINS='4uvpjjoqk5o8bia'



# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- gist.githack.com/mikeytown2/1637d98130ac7dfbfa4d24bac0598107/raw/mcarper.sh -O ~/___mn.sh
  COUNTER=$(( COUNTER + 1 ))
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane 2>/dev/null
