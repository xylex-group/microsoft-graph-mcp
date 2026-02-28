FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app/src

WORKDIR /app

COPY pyproject.toml fastmcp.json mcp-tools.json README.md authenticate.py ./
COPY src ./src

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir \
    "fastmcp>=3.0.2" \
    "httpx>=0.28.1" \
    "msal>=1.32.3" \
    "python-dotenv>=1.1.0"

ENTRYPOINT ["fastmcp"]
CMD ["run", "fastmcp.json", "--skip-env"]
