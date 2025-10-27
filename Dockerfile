# Use an official lightweight Python image as the base
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first (for better build caching)
#COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your app’s code
COPY . .

# Expose port 5000 (or whatever your app uses)
EXPOSE 5000

# Define environment variables
ENV PYTHONUNBUFFERED=1

# Command to run your app (update as needed)
CMD ["python", "app.py"]
