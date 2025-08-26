# Backend - Qual o Melhor

API Node.js/Express para o comparador de produtos, integrando com a API do Mercado Livre.

## 🚀 Instalação

```bash
npm install
```

## 🔧 Configuração

1. Copie o arquivo de exemplo de variáveis de ambiente:
```bash
cp env.example .env
```

2. Configure as variáveis no arquivo `.env`:
```env
PORT=3001
NODE_ENV=development
MERCADO_LIVRE_API_URL=https://api.mercadolibre.com
CORS_ORIGIN=http://localhost:3000
```

## 🏃‍♂️ Execução

### Desenvolvimento
```bash
npm run dev
```

### Produção
```bash
npm run build
npm start
```

## 📡 Endpoints

### Health Check
- `GET /health` - Verificar status da API

### Produtos
- `GET /api/products/search?query=notebook` - Buscar produtos
- `GET /api/products/:id` - Buscar detalhes de um produto
- `GET /api/products/categories` - Listar categorias
- `GET /api/products/categories/:categoryId` - Produtos por categoria

### Parâmetros de Busca
- `query` (obrigatório): Termo de busca
- `limit` (opcional): Número de resultados (padrão: 20)
- `offset` (opcional): Offset para paginação (padrão: 0)
- `sort` (opcional): Ordenação (price_asc, price_desc, relevance)
- `condition` (opcional): Condição do produto (new, used)

## 🔧 Tecnologias

- Node.js
- Express
- TypeScript
- Axios (para requisições HTTP)
- Helmet (segurança)
- CORS
- Rate Limiting

## 📁 Estrutura

```
src/
├── controllers/     # Controladores da API
├── routes/         # Definição de rotas
├── services/       # Serviços de negócio
├── types/          # Tipos TypeScript
├── middleware/     # Middlewares customizados
└── index.ts        # Arquivo principal
```
