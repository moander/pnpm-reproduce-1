FROM ubuntu

WORKDIR /app

RUN apt-get update && apt-get install -y curl ca-certificates

ENV PNPM_HOME=/pnpm PATH="/pnpm:${PATH}"

RUN curl -fsSL "https://github.com/pnpm/pnpm/releases/latest/download/pnpm-linuxstatic-x64" -o /bin/pnpm; chmod +x /bin/pnpm;

COPY pnpm-lock.yaml .

RUN pnpm fetch
