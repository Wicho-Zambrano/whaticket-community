FROM node:16

WORKDIR /app

COPY ./backend/package*.json ./backend/
COPY ./frontend/package*.json ./frontend/

WORKDIR /app/backend
RUN npm install

WORKDIR /app/frontend
RUN npm install && npm run build

WORKDIR /app
COPY . .

WORKDIR /app/backend
EXPOSE 8080

CMD ["npm", "start"]
