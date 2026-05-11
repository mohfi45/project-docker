# ==========================================
# STAGE 1: BUILDER (Fase Merakit Aplikasi)
# ==========================================
FROM node:18-alpine AS builder
WORKDIR /app

# 1. Install dependencies (Copy package.json lebih dulu agar proses cache Docker optimal)
COPY package*.json ./
RUN npm install

# 2. Copy seluruh source code dan lakukan Build
COPY . .
RUN npm run build 


# ==========================================
# STAGE 2: RUNNER (Fase Server Production)
# ==========================================
FROM node:18-alpine AS runner
WORKDIR /app

# Set environment ke mode production
ENV NODE_ENV=production

# 3. Copy asset publik (seperti gambar, favicon di folder public)
COPY --from=builder /app/public ./public

# 4. Copy mesin utama aplikasi (Folder Standalone)
COPY --from=builder /app/.next/standalone ./

# 5. Copy aset statis Next.js (CSS, JS hasil kompilasi)
COPY --from=builder /app/.next/static ./.next/static

# Buka port internal kontainer
EXPOSE 3000

# Eksekusi file server.js (Bawaan dari mode standalone Next.js)
CMD ["node", "server.js"]