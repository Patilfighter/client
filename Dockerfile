FROM node:16
WORKDIR /app
copy package.json package-lock.json ./
RUN npm install
copy . .
RUN npm run build
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]
