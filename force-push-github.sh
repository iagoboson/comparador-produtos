#!/bin/bash

echo "🚀 Forçando criação do repositório no GitHub..."

# Tentar diferentes nomes de usuário
USERS=("iagoboson" "iago-boson" "iagoboson" "iago")

for USER in "${USERS[@]}"; do
    echo "🔍 Tentando usuário: $USER"
    
    # Configurar remote
    git remote set-url origin https://github.com/$USER/qual-o-melhor.git
    
    # Tentar push
    if git push -u origin main 2>/dev/null; then
        echo "✅ Sucesso! Repositório criado em: https://github.com/$USER/qual-o-melhor"
        exit 0
    else
        echo "❌ Falhou para usuário: $USER"
    fi
done

echo ""
echo "❌ Não foi possível criar o repositório automaticamente."
echo ""
echo "🔧 Solução manual:"
echo "1. Acesse: https://github.com/new"
echo "2. Nome: qual-o-melhor"
echo "3. Descrição: Comparador de produtos focado no mercado brasileiro"
echo "4. NÃO inicialize com README"
echo "5. Clique em 'Create repository'"
echo "6. Execute: git push -u origin main"
echo ""
echo "💡 Ou use o GitHub Desktop que já está aberto:"
echo "1. File → New Repository"
echo "2. Configure e publique"
