# Bothost.ru - Telegram Bot Dockerfile
FROM python:3.11-slim

# Рабочая директория
WORKDIR /app

# Установка зависимостей
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копирование файлов проекта
COPY . .

# Создание директории для базы данных
RUN mkdir -p /app/data

# Переменные окружения
ENV PYTHONUNBUFFERED=1
ENV DATABASE_PATH=/app/data/booking.db

# Запуск бота
CMD ["python", "bot.py"]
