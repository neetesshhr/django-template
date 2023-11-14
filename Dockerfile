# Use an official Python runtime as a parent image
FROM python:3.9

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /usr/src/app

# Install dependencies
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . /usr/src/app/

# Copy entrypoint script
COPY entrypoint.sh /usr/src/app/entrypoint.sh

# Ensure the script is executable (this may be redundant if the permissions are correct from the host)
RUN chmod +x /usr/src/app/entrypoint.sh

# Set the entrypoint script to be executed
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

