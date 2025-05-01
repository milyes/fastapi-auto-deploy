#!/bin/bash

# CONFIGURATION
PORT=8000
APP="main:app"
TUNNEL_BIN="$(which cloudflared)"

# Couleurs
GREEN='\033[0;32m'
NC='\033[0m'

# Étape 1 : Vérifier si uvicorn est installé
if ! command -v uvicorn &>/dev/null; then
    echo "Uvicorn n'est pas installé. Installation..."
    pip install uvicorn fastapi
fi

# Étape 2 : Lancer le serveur FastAPI
echo -e "${GREEN}Démarrage du serveur FastAPI...${NC}"
nohup uvicorn $APP --host 0.0.0.0 --port $PORT > server.log 2>&1 &

# Pause 2s pour laisser le serveur démarrer
sleep 2

# Étape 3 : Vérifier si cloudflared est installé
if [ -z "$TUNNEL_BIN" ]; then
    echo "Installation de cloudflared..."
    pkg install cloudflared -y
    TUNNEL_BIN="$(which cloudflared)"
fi

# Étape 4 : Lancer le tunnel Cloudflare
echo -e "${GREEN}Ouverture du tunnel Cloudflare...${NC}"
$TUNNEL_BIN tunnel --url http://localhost:$PORT
