#!/data/data/com.termux/files/usr/bin/bash

cd ~/storage/downloads/ia_netmsg_saml/api

echo "[+] Lancement de l'API Flask IA_NETMSG avec SAML..."
nohup python app.py > ../server_ia_netmsg_saml.log 2>&1 &

termux-toast "API IA_NETMSG SAML lancée sur http://localhost:5000"
