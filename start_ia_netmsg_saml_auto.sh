#!/data/data/com.termux/files/usr/bin/bash

# Recherche automatique du dossier contenant app.py
APP_PATH=$(find ~/storage/downloads -type f -name "app.py" -exec dirname {} \; | grep "ia_netmsg_saml" | head -n 1)

if [ -z "$APP_PATH" ]; then
  echo "[!] Dossier IA_NETMSG SAML introuvable."
  termux-toast "Erreur : app.py introuvable"
  exit 1
fi

echo "[+] Dossier trouvé : $APP_PATH"
cd "$APP_PATH"

echo "[+] Lancement de l'API Flask IA_NETMSG avec SAML..."
nohup python app.py > ../server_ia_netmsg_saml.log 2>&1 &
termux-toast "IA_NETMSG SAML lancé sur :5000"
