FROM node:18.4.0
WORKDIR /app
RUN npm install
EXPOSE 8080
COPY app.js .
CMD ["npm", "start"]
#RUN npm run build
#CMD ["node","app.js"]
