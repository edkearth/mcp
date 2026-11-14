# A container for directories that run MCP servers themselves (Smithery, Glama, Docker MCP Catalog).
FROM node:22-alpine
WORKDIR /app
COPY package.json index.js ./
ENV NODE_ENV=production
ENTRYPOINT ["node", "index.js"]
