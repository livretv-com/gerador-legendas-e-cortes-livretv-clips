FROM python:3.11-slim
WORKDIR /app
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip install fastapi uvicorn python-multipart openai python-dotenv supabase
RUN if [ -f "backend/requirements.txt" ]; then pip install -r backend/requirements.txt; fi
RUN if [ -f "supabase/requirements.txt" ]; then pip install -r supabase/requirements.txt; fi
EXPOSE 8000
CMD ["sh", "-c", "uvicorn backend.main:app --host 0.0.0.0 --port ${PORT:-8000}"]
