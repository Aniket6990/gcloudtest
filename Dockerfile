#stage1
FROM node:20-alpine3.18 as builder
WORKDIR /build
COPY package*.json .
RUN npm install
COPY index.ts index.ts
COPY tsconfig.json tsconfig.json
RUN npm run build

#stage 2
FROM node:20-alpine3.18 as runner
WORKDIR /app
COPY --from=builder build/package*.json .
COPY --from=builder build/node_modules node_modules/
COPY --from=builder build/dist dist/
EXPOSE 4000
CMD [ "npm", "start" ]