
#!/bin/bash

# Étape 1 : extraire tous les .zip vers $HOME
echo "📦 Extraction des fichiers ZIP vers $HOME..."
unzip -o *.zip -d $HOME

# Étape 2 : supprimer les fichiers ZIP après extraction
echo "🧹 Suppression des fichiers ZIP..."
rm -f *.zip

# Étape 3 : vérifier et exécuter start_cloudflare.sh
if [ -f "$HOME/start_cloudflare.sh" ]; then
    echo "🚀 Script start_cloudflare.sh trouvé. Lancement..."
    chmod +x "$HOME/start_cloudflare.sh"
    cd "$HOME"
    
    # Lancer le serveur et capturer le lien Cloudflare
    cloudflared tunnel --url http://localhost:8000 2>&1 | tee tunnel_output.log | while read line; do
        echo "$line"
        if [[ "$line" == *"https://"*".trycloudflare.com"* ]]; then
            url=$(echo "$line" | grep -o "https://[a-zA-Z0-9.-]*.trycloudflare.com")
            echo "🌐 Lien détecté : $url"
            termux-open-url "$url"
            break
        fi
    done
else
    echo "⚠️ Aucun fichier start_cloudflare.sh trouvé dans $HOME"
fi
