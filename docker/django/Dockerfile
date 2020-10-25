FROM python:3.8
RUN mkdir /app
WORKDIR /app 
COPY . /app
RUN apt-get update -y &&\
	pip install --upgrade pip &&\
	pip install --no-cache -r requirements.txt
