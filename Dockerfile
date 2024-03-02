FROM node:20-alpine3.18
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 4000
ENTRYPOINT ["node", "dist/index.js"]
CMD ["node", "dist/index.js"]
