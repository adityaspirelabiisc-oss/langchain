# Use an official lightweight Python base image

FROM python:3.11-slim



# Set environment variables to optimize Python behavior inside Docker

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1



# Set the working directory inside the container

WORKDIR /app



# Install basic system build dependencies often required by C-extensions (like FAISS)

RUN apt-get update && apt-get install -y --no-install-recommends \

    build-essential \

    && rm -rf /var/lib/apt/lists/*



# Copy the requirements file into the container

COPY requirements.txt .



# Upgrade pip and install the packages

RUN pip install --no-cache-dir --upgrade pip && \

    pip install --no-cache-dir -r requirements.txt



# Copy your RAG application script into the container

COPY rag_pipeline.py .



# Command to run your pipeline

CMD ["python", "rag_pipeline.py"] 


