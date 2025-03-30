FROM node:16-alpine

WORKDIR /var/www/html

COPY www/package*.json ./

RUN npm install

COPY . .

EXPOSE 5173

CMD ["npm", "run", "dev"]