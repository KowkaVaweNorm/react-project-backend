FROM node:20.11.1-slim

# Папка приложения
ARG APP_DIR=app
RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}

# Установка зависимостей
COPY package*.json ./
RUN npm install
# Для использования в продакшне
# RUN npm install --production

# Копирование файлов проекта
COPY . .

# Уведомление о порте, который будет прослушивать работающее приложение
EXPOSE 8000

# Запуск проекта
CMD ["npm", "start"]