FROM python:3.9-bullseye

WORKDIR /usr/src/sample

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .