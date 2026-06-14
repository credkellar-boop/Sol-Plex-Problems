# ==============================================================================
# 1. BASE SYSTEM LAYER
# ==============================================================================
FROM python:3.11-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install native compilation dependencies if needed by numpy/crypto libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# ==============================================================================
# 2. DEPENDENCY LAYER
# ==============================================================================
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# ==============================================================================
# 3. APPLICATION & RUNTIME LAYER
# ==============================================================================
# Copy the entire src directory into the container image
COPY src/ ./src/

# Set up runtime environmental pathing so python knows where to locate modules
ENV PYTHONPATH="/app/src:${PYTHONPATH}"

# Enforce security best-practices using a non-root system user
RUN useradd --create-home --shell /bin/bash solplexuser \
    && chown -R solplexuser:solplexuser /app

USER solplexuser

EXPOSE 8080

# Execute the primary computational engine from within the source block
CMD ["python", "src/cognitive/math-engine.py"]
