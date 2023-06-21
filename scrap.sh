#!/bin/bash

curl https://www.vulnhub.com/ > log.log 2>/dev/null

echo "Máquinas disponibles: "

cat log.log | grep 'href="/entry' | tr -d '#' | sed 's/entry/ /' | awk '{print $3}' | tr -d '/' | sed 's/download/ /' | sed 's/"/ /' | tr -d '>' | tr -d ' ' | uniq  

cat log.log | grep noob >/dev/null
if [ "$(echo $?)" == "0" ]; then
	echo "[*] Sin cambios..."
else
	echo "[*] Hay máquinas nuevas..."
fi

rm log.log

