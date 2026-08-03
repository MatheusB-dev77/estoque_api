# 1. Imagem base oficial, leve, para Node.js
FROM node:20-alpine

# 2. Diretório de trabalho dentro do container
WORKDIR /app

# 3. Copia primeiro os arquivos de dependência (aproveita cache do Docker)
COPY package*.json ./

# 4. Instala as dependências mapeadas no package.json
RUN npm install

# 5. Copia o restante do código-fonte (incluindo contracts/ e config/)
COPY . .

# 6. Documenta a porta usada pelo servidor
EXPOSE 3000

# 7. Comando de inicialização padrão do container
CMD ["node", "server.js"]
