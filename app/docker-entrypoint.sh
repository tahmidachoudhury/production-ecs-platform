#!/bin/sh
set -e

if [ -z "$DB_USERNAME" ] || [ -z "$DB_PASSWORD" ] || [ -z "$DB_HOST" ] || [ -z "$DB_PORT" ] || [ -z "$DB_NAME" ]; then
  echo "Missing required database environment variables (DB_USERNAME, DB_PASSWORD, DB_HOST, DB_PORT, DB_NAME)." >&2
  exit 1
fi

ENCODED_PASS=$(node -e "console.log(encodeURIComponent(process.argv[1]))" "$DB_PASSWORD")
export DATABASE_URL="postgresql://${DB_USERNAME}:${ENCODED_PASS}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=require&sslrootcert=/app/global-bundle.pem"

exec "$@"
