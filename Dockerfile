# stage 1: dependencies
ARG NODE_IMAGE_VERSION="22-slim"

FROM ${NODE_IMAGE_VERSION} AS deps
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile

# stage 2: build

FROM ${NODE_IMAGE_VERSION} AS build
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
ENV DATABASE_URL="postgresql://user:pass@localhost:5432/dummy"
RUN npm run build-docker

# stage 3: run

FROM ${NODE_IMAGE_VERSION} AS runner
WORKDIR /app

ARG PRISMA_VERSION="6.19.0"

RUN npm install -g pnpm

RUN pnpm --allow-build='@prisma/engines' add npm-run-all dotenv chalk semver \
    prisma@${PRISMA_VERSION} \
    @prisma/adapter-pg@${PRISMA_VERSION}

COPY --from=build /app/public ./public
COPY --from=build /app/prisma ./prisma
COPY --from=build /app/scripts ./scripts
COPY --from=build /app/generated ./generated

COPY --from=build /app/.next/standalone ./
COPY --from=build /app/.next/static ./.next/static

EXPOSE 3000
ENV PORT=3000
ENV HOSTNAME=0.0.0.0

CMD [ "pnpm", "start-docker" ]