# 🚀 Configuração do GitHub

## Passos para conectar ao GitHub:

### 1. Criar repositório no GitHub
1. Acesse [github.com](https://github.com)
2. Clique em "New repository"
3. Nome: `qual-o-melhor` ou `comparador-produtos`
4. Descrição: "Comparador de produtos focado no mercado brasileiro"
5. Deixe público ou privado (sua escolha)
6. **NÃO** inicialize com README, .gitignore ou license
7. Clique em "Create repository"

### 2. Conectar repositório local ao GitHub

Execute os seguintes comandos no terminal:

```bash
# Adicionar o remote do GitHub (substitua USERNAME pelo seu usuário)
git remote add origin https://github.com/USERNAME/qual-o-melhor.git

# Verificar se foi adicionado corretamente
git remote -v

# Fazer push para o GitHub
git branch -M main
git push -u origin main
```

### 3. Verificar se funcionou
- Acesse seu repositório no GitHub
- Você deve ver todos os arquivos do projeto
- O commit inicial deve aparecer no histórico

## 📁 Estrutura que será enviada:

```
comparador-produtos/
├── frontend/          # Aplicação Next.js
├── backend/           # API Node.js/Express
├── README.md          # Documentação principal
├── setup.sh           # Script de instalação
├── .gitignore         # Arquivos ignorados pelo Git
└── GITHUB_SETUP.md    # Este arquivo
```

## 🔧 Próximos passos após o push:

1. Execute o script de setup:
   ```bash
   ./setup.sh
   ```

2. Inicie o backend:
   ```bash
   cd backend
   npm run dev
   ```

3. Em outro terminal, inicie o frontend:
   ```bash
   cd frontend
   npm run dev
   ```

4. Acesse http://localhost:3000 para ver a aplicação funcionando!

## 🎯 Funcionalidades implementadas:

- ✅ Estrutura completa do projeto
- ✅ Backend com API REST
- ✅ Frontend com Next.js
- ✅ Integração com Mercado Livre
- ✅ Interface responsiva
- ✅ Busca de produtos
- ✅ Filtros e ordenação
- ✅ Design moderno
