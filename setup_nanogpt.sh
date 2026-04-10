#!/bin/bash
# NanoGPT + GLM-5 Setup Script
# Führe dieses Script aus und füge deinen API Token ein

echo "=========================================="
echo "NanoGPT + GLM-5 Setup"
echo "=========================================="
echo ""

# Prüfe ob nano-gpt installiert ist
if ! command -v nano-gpt &> /dev/null; then
    echo "nano-gpt nicht gefunden. Installiere..."
    
    # Installiere nano-gpt
    if command -v npm &> /dev/null; then
        npm install -g nano-gpt
    elif command -v pip &> /dev/null; then
        pip install nano-gpt
    else
        echo "Fehler: Weder npm noch pip gefunden."
        echo "Bitte installiere Node.js oder Python zuerst."
        exit 1
    fi
fi

echo ""
echo "=========================================="
echo "Konfiguration"
echo "=========================================="
echo ""

# Erstelle Config-Verzeichnis
mkdir -p ~/.config/nano-gpt

# Frage nach API Token
echo "Bitte gib deinen GLM-5 API Token ein:"
echo "(Der Token wird nicht angezeigt)"
read -s API_TOKEN
echo ""

# Erstelle Konfigurationsdatei
cat > ~/.config/nano-gpt/config.json << EOF
{
  "defaultProvider": "zhipuai-cep",
  "providers": {
    "zhipuai-cep": {
      "baseUrl": "https://open.bigmodel.cn/api/paas/v4",
      "apiKey": "${API_TOKEN}",
      "models": {
        "glm-5": {
          "id": "glm-5",
          "name": "GLM-5"
        }
      }
    }
  },
  "defaultModel": "glm-5"
}
EOF

echo ""
echo "=========================================="
echo "Setup abgeschlossen!"
echo "=========================================="
echo ""
echo "Konfiguration gespeichert in: ~/.config/nano-gpt/config.json"
echo ""
echo "Verwendung:"
echo "  nano-gpt --provider zhipuai-cep --model glm-5 'Deine Frage'"
echo ""
echo "Oder einfach:"
echo "  nano-gpt 'Deine Frage'"
echo ""
echo "Teste die Verbindung:"
echo "  nano-gpt --provider zhipuai-cep --model glm-5 'Hallo, bist du da?'"
echo ""
