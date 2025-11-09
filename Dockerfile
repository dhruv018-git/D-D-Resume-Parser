# Use a standard Python 3.11 image
FROM python:3.11-slim

# Set a work directory
WORKDIR /app

# --- This is the most important part ---
# Install the system dependencies (Tesseract and Poppler)
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# Copy your requirements file and install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your app code (app.py, index.html, etc.)
COPY . .

# Tell Render what port your app runs on (from your app.py)
EXPOSE 7860

# --- This is your Gunicorn Start Command ---
# It runs your 'app' variable from your 'app.py' file
CMD ["gunicorn", "--workers", "2", "--bind", "0.0.0.0:7860", "app:app"]