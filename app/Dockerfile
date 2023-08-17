FROM nginx:stable-alpine

# This is the testing machine product_uuid
RUN echo "9111c200-3303-11ea-8000-ac1f6bf5f886" | tee product_uuid && \
  mkdir -p /etc/id/ && \
  mv product_uuid /etc/id/

RUN apk add --no-cache \
  bash \
  curl \
  jq \
  perl-utils

COPY health.sh ./

RUN chmod a+x ./health.sh
