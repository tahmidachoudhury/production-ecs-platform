#!/usr/bin/env bash
set -e

REGION="eu-west-2"

RDS_SECRET_ARN=$(terraform output -raw db_master_secret_arn)
APP_SECRET_ARN=$(terraform output -raw database_url_secret_arn)
DB_HOST=$(terraform output -raw db_host)
DB_PORT=$(terraform output -raw db_port)
DB_NAME=$(terraform output -raw db_name)

# Get RDS secret JSON
SECRET_JSON=$(aws secretsmanager get-secret-value \
  --region $REGION \
  --secret-id $RDS_SECRET_ARN \
  --query SecretString \
  --output text)

USERNAME=$(echo $SECRET_JSON | jq -r '.username')
PASSWORD=$(echo $SECRET_JSON | jq -r '.password')

# URL encode password
ENCODED_PASSWORD=$(node -e "console.log(encodeURIComponent(process.argv[1]))" "$PASSWORD")

DATABASE_URL="postgresql://${USERNAME}:${ENCODED_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}"

# Push to your app secret
aws secretsmanager put-secret-value \
  --region $REGION \
  --secret-id $APP_SECRET_ARN \
  --secret-string "$DATABASE_URL"