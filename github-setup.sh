#!/bin/bash

echo "🚀 Configurando integração com GitHub..."

# Verificar se o usuário forneceu o nome do repositório
if [ -z "$1" ]; then
    echo "❌ Por favor, forneça o nome do repositório como argumento."
    echo "Uso: ./github-setup.sh NOME_DO_REPOSITORIO"
    echo "Exemplo: ./github-setup.sh qual-o-melhor"
    exit 1
fi

REPO_NAME=$1
USERNAME=$(git config user.name 2>/dev/null || echo "seu-usuario")

echo "📝 Configurando repositório: $REPO_NAME"
echo "👤 Usuário: $USERNAME"

# Adicionar o remote do GitHub
echo "🔗 Adicionando remote do GitHub..."
git remote add origin https://github.com/$USERNAME/$REPO_NAME.git

# Verificar se foi adicionado corretamente
echo "✅ Remote adicionado:"
git remote -v

# Fazer push para o GitHub
echo "📤 Fazendo push para o GitHub..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Sucesso! Repositório configurado no GitHub."
    echo "🌐 Acesse: https://github.com/$USERNAME/$REPO_NAME"
    echo ""
    echo "📋 Próximos passos:"
    echo "1. Acesse o repositório no GitHub"
    echo "2. Configure as descrições e tags"
    echo "3. Adicione um README mais detalhado se necessário"
    echo ""
else
    echo ""
    echo "❌ Erro ao fazer push para o GitHub."
    echo "📋 Verifique se:"
    echo "1. O repositório existe no GitHub"
    echo "2. Você tem permissões para fazer push"
    echo "3. Suas credenciais estão configuradas"
    echo ""
    echo "🔧 Para criar o repositório manualmente:"
    echo "1. Acesse: https://github.com/new"
    echo "2. Nome: $REPO_NAME"
    echo "3. Descrição: Comparador de produtos focado no mercado brasileiro"
    echo "4. Deixe público ou privado"
    echo "5. NÃO inicialize com README"
    echo "6. Execute novamente: ./github-setup.sh $REPO_NAME"
    echo ""
fi
