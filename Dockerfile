FROM python:3.9-alpine
MAINTAINER Adeola Adefolaju "aadefolaju@gmail.com"
WORKDIR /app
COPY ./ ./
RUN pip install -r requirements.txt
CMD python app.py

