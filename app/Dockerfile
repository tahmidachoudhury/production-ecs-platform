ARG NODE_IMAGE_VERSION="22-slim"

FROM node:${NODE_IMAGE_VERSION} AS deps
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
ARG PNPM_VERSION="9.15.9"
RUN npm install -g pnpm@${PNPM_VERSION}
RUN pnpm --version
RUN pnpm install --frozen-lockfile

FROM node:${NODE_IMAGE_VERSION} AS build
WORKDIR /app
COPY global-bundle.pem /app/global-bundle.pem
COPY --from=deps /app/node_modules ./node_modules
COPY . .
ENV DATABASE_URL="postgresql://user:pass@localhost:5432/dummy"
RUN npm run build-docker

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

RUN npm install --omit=dev --no-save \
    dotenv chalk semver \
    prisma@${PRISMA_VERSION} \
    @prisma/adapter-pg@${PRISMA_VERSION}

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["sh", "-c", "export PATH=\"/app/node_modules/.bin:$PATH\" && node scripts/check-db.js && node scripts/update-tracker.js && node server.js"]
