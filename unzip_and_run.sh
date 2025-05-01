#!/bin/bash

# Étape 1 : extraire tous les zip dans $HOME
echo "📦 Extraction de tous les .zip vers $HOME..."
unzip -o *.zip -d $HOME

# Étape 2 : vérifier et exécuter start_cloudflare.sh
if [ -f "$HOME/start_cloudflare.sh" ]; then
    echo "🚀 Script start_cloudflare.sh trouvé. Lancement..."
    chmod +x "$HOME/start_cloudflare.sh"
    cd "$HOME"
    ./start_cloudflare.sh
else
    echo "⚠️ Aucun fichier start_cloudflare.sh trouvé dans $HOME"
fi

