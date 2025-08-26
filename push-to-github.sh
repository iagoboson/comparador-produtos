#!/bin/bash

echo "🚀 Push para GitHub via linha de comando..."

# Verificar se o usuário forneceu o nome do repositório
if [ -z "$1" ]; then
    echo "❌ Por favor, forneça o nome do repositório como argumento."
    echo "Uso: ./push-to-github.sh NOME_DO_REPOSITORIO"
    echo "Exemplo: ./push-to-github.sh qual-o-melhor"
    echo ""
    echo "🔧 Primeiro, crie o repositório no GitHub:"
    echo "1. Acesse: https://github.com/new"
    echo "2. Nome: qual-o-melhor"
    echo "3. Descrição: Comparador de produtos focado no mercado brasileiro"
    echo "4. NÃO inicialize com README"
    echo "5. Execute: ./push-to-github.sh qual-o-melhor"
    exit 1
fi

REPO_NAME=$1
USERNAME="iagoboson"

echo "📝 Configurando push para: $REPO_NAME"
echo "👤 Usuário: $USERNAME"

# Verificar se o remote já existe
if git remote get-url origin > /dev/null 2>&1; then
    echo "🔄 Atualizando remote existente..."
    git remote set-url origin https://github.com/$USERNAME/$REPO_NAME.git
else
    echo "🔗 Adicionando remote..."
    git remote add origin https://github.com/$USERNAME/$REPO_NAME.git
fi

# Verificar remote
echo "✅ Remote configurado:"
git remote -v

# Fazer push
echo "📤 Fazendo push para o GitHub..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Sucesso! Repositório publicado no GitHub."
    echo "🌐 Acesse: https://github.com/$USERNAME/$REPO_NAME"
    echo ""
    echo "📋 Próximos passos:"
    echo "1. Configure a descrição do repositório"
    echo "2. Adicione tags se necessário"
    echo "3. Configure GitHub Pages se desejar"
    echo "4. Compartilhe o link do projeto"
    echo ""
else
    echo ""
    echo "❌ Erro ao fazer push."
    echo "🔧 Verifique se:"
    echo "1. O repositório existe no GitHub"
    echo "2. Você tem permissões"
    echo "3. Suas credenciais estão configuradas"
    echo ""
    echo "💡 Alternativa: Use o GitHub Desktop"
    echo "1. Abra o GitHub Desktop"
    echo "2. File → New Repository"
    echo "3. Configure e publique"
    echo ""
fi
