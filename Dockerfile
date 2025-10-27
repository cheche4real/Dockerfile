# Use an official lightweight Python image as the base
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Set working directory inside the container
WORKDIR /app

# Copy only requirements file first (for build caching)
COPY ./requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Expose port 5000 (or whatever your app uses)
EXPOSE 5000

# Create a non-root user for security
RUN adduser --disabled-password appuser && chown -R appuser /app
USER appuser

# Default command to run your Python app
CMD ["python", "app.py"]

