FROM "node:24-alpine3.21"

WORKDIR /app

COPY . .

CMD ["npm","run","start:dev"]

# ENV NODE_ENV=production