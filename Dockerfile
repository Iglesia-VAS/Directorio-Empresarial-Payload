FROM node:18.8-alpine as base
RUN corepack enable && corepack prepare pnpm@latest --activate

FROM base as builder

WORKDIR /home/node/app
COPY package.json pnpm-lock.yaml ./

COPY . .
RUN pnpm install --frozen-lockfile
RUN pnpm run build

FROM base as runtime

ENV NODE_ENV=production
ENV PAYLOAD_CONFIG_PATH=dist/payload.config.js

WORKDIR /home/node/app
COPY package.json pnpm-lock.yaml ./

RUN pnpm install --prod --frozen-lockfile
COPY --from=builder /home/node/app/dist ./dist
COPY --from=builder /home/node/app/build ./build

EXPOSE 3000

CMD ["node", "dist/server.js"]
