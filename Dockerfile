FROM oven/bun:1

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json bun.lock turbo.json ./
COPY applications/api/package.json ./applications/api/
COPY applications/web/package.json ./applications/web/

RUN bun install

COPY . .

ENV TURBO_UI=0

EXPOSE 4000 5173

CMD ["bun", "run", "dev"]
