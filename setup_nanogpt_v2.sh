#!/bin/bash
# NanoGPT + GLM-5 Setup Script

echo "=========================================="
echo "NanoGPT + GLM-5 Setup"
echo "=========================================="
echo ""

# Prüfe ob nano-gpt installiert ist
if ! command -v nano-gpt &> /dev/null; then
    echo "nano-gpt nicht gefunden. Installiere..."
    npm install -g nano-gpt 2>/dev/null || pip install nano-gpt 2>/dev/null
fi

echo ""
echo "Bitte gib deinen GLM-5 API Token ein:"
read -s API_TOKEN
echo ""

# Erstelle Config-Verzeichnis
mkdir -p ~/.config/nano-gpt

# Erstelle Konfigurationsdatei
cat > ~/.config/nano-gpt/config.json << CONFIGEOF
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
CONFIGEOF

echo ""
echo "Setup abgeschlossen!"
echo ""
echo "Test: nano-gpt 'Hallo'"
