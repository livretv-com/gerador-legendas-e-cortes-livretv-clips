FROM python:3.11-slim
WORKDIR /app
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip install fastapi uvicorn python-multipart python-dotenv supabase openai requests httpx pydantic
ENV PYTHONPATH=/app:/app/backend
EXPOSE 8000
CMD ["sh", "-c", "cd /app/backend && uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}"]
