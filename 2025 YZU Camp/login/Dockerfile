FROM mcr.microsoft.com/playwright/python:v1.54.0-jammy

COPY ./app /app

WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python3","app.py"]
