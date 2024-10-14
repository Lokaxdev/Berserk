#!/bin/bash
echo "[i] We will now install Raven-Storm to your bin path..."
if [ -d "/usr/share/Raven-Storm" ] ; then
    echo "[i] Found an old version of BERSERK, proceeding to update..."
    echo "[i] Backing up old verison."
    if [ -d "/usr/share/Raven-Storm/Backup" ] ; then
        sudo mv /usr/share/Raven-Storm/Backup ./Backup
    else
        mkdir ./Backup
    fi
    name="./Backup/Raven-Storm"
    if [ -d $name ] ; then
        i=0
        while [ -d "$name.bak$i" ] ; do
            let i++
        done
            name="$name.bak$i"
    fi
    sudo mv /usr/share/Raven-Storm $name
    mv ./Backup ./Raven-Storm/
    sudo cp -ar ./Raven-Storm /usr/share/
    echo "[i] Installation sucessful."
    echo "[i] Making Raven-Storm executable..."
    sudo mv /usr/share/Raven-Storm/main.py /usr/share/Raven-Storm/berserk
    sudo chmod +x /usr/share/Raven-Storm/berserk
    sudo ln -s /usr/share/Raven-Storm/rst /usr/bin/berserk || echo "[i] Link already seems to exist."
else
    sudo cp -ar ./Raven-Storm /usr/share/
    echo "[i] Installation sucessful."
    echo "[i] Making Raven-Storm executable..."
    sudo mv /usr/share/Raven-Storm/main.py /usr/share/Raven-Storm/berserk
    sudo chmod +x /usr/share/Raven-Storm/berserk
    sudo ln -s /usr/share/Raven-Storm/rst /usr/bin/berserk || echo "[i] Link already seems to exist."
fi

echo "[i] You can delete the Raven-Storm folder now."
echo "----------------------------------------"
echo "[i] Run 'sudo berserk' to start BERSERKER."
echo "----------------------------------------"
exit 0
