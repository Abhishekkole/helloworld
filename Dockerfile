FROM node:16.3.0-alpine
WORKDIR /app
RUN npm install
EXPOSE 8080
COPY app.js .
RUN npm run build
CMD ["node","app.js"]