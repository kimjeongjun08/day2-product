FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN --mount=type=cache,target=/root/.cache \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["uvicorn", "app:app", "--host=0.0.0.0", "--port=8080"]
