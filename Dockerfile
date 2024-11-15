FROM python:3.11-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
WORKDIR /app


# Copy requirements and install dependencies
COPY requirements.txt .
RUN uv venv
RUN uv pip install -r requirements.txt

# Copy application code
COPY app.py .

# Expose port 7860
EXPOSE 7860
ENV GRADIO_SERVER_NAME="0.0.0.0"
# Run the application
CMD ["uv", "run", "app.py"]
