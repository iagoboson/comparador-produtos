#!/bin/bash

echo "🚀 Configurando o projeto Qual o Melhor..."

# Verificar se Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "❌ Node.js não está instalado. Por favor, instale o Node.js primeiro."
    exit 1
fi

echo "✅ Node.js encontrado: $(node --version)"

# Configurar backend
echo "📦 Configurando backend..."
cd backend

# Copiar arquivo de ambiente
if [ ! -f .env ]; then
    cp env.example .env
    echo "✅ Arquivo .env criado para o backend"
fi

# Instalar dependências
npm install
echo "✅ Dependências do backend instaladas"

cd ..

# Configurar frontend
echo "📦 Configurando frontend..."
cd frontend

# Copiar arquivo de ambiente
if [ ! -f .env.local ]; then
    cp env.local.example .env.local
    echo "✅ Arquivo .env.local criado para o frontend"
fi

# Instalar dependências
npm install
echo "✅ Dependências do frontend instaladas"

cd ..

echo ""
echo "🎉 Configuração concluída!"
echo ""
echo "📋 Para executar o projeto:"
echo ""
echo "1. Backend (Terminal 1):"
echo "   cd backend"
echo "   npm run dev"
echo ""
echo "2. Frontend (Terminal 2):"
echo "   cd frontend"
echo "   npm run dev"
echo ""
echo "🌐 URLs:"
echo "   Frontend: http://localhost:3000"
echo "   Backend:  http://localhost:3001"
echo ""
echo "🔍 Teste a API:"
echo "   curl http://localhost:3001/health"
echo ""
