# stage 1: dependencies
ARG NODE_IMAGE_VERSION="22-slim"

FROM node:${NODE_IMAGE_VERSION} AS deps
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
ARG PNPM_VERSION="9.15.9"
RUN npm install -g pnpm@${PNPM_VERSION}
RUN pnpm --version
RUN pnpm install --frozen-lockfile

# stage 2: build

FROM node:${NODE_IMAGE_VERSION} AS build
WORKDIR /app
COPY global-bundle.pem /app/global-bundle.pem
COPY --from=deps /app/node_modules ./node_modules
COPY . .
ENV DATABASE_URL="postgresql://user:pass@localhost:5432/dummy"
RUN npm run build-docker

# stage 3: run

FROM node:${NODE_IMAGE_VERSION} AS runner
WORKDIR /app

ARG PRISMA_VERSION="6.19.0"

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
ENV PORT=3000
ENV HOSTNAME=0.0.0.0

COPY --from=build /app/.next/standalone ./
COPY --from=build /app/.next/static ./.next/static
COPY --from=build /app/public ./public
COPY --from=build /app/prisma ./prisma
COPY --from=build /app/scripts ./scripts
COPY --from=build /app/generated ./generated
COPY --from=build /app/global-bundle.pem /app/global-bundle.pem

RUN mkdir -p /tmp/runtime-deps /app/node_modules/.bin /app/node_modules/@prisma && \
    printf '%s\n' '{"private":true}' > /tmp/runtime-deps/package.json && \
    npm install --prefix /tmp/runtime-deps --omit=dev \
      dotenv chalk semver \
      prisma@${PRISMA_VERSION} \
      @prisma/adapter-pg@${PRISMA_VERSION} && \
    find /tmp/runtime-deps/node_modules -mindepth 1 -maxdepth 1 ! -name pg -exec cp -a {} /app/node_modules/ \; && \
    rm -rf /tmp/runtime-deps

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["sh", "-c", "export PATH=\"/app/node_modules/.bin:$PATH\" && node scripts/check-db.js && node scripts/update-tracker.js && node server.js"]
