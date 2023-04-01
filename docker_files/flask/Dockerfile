FROM python:3.8
RUN apt-get update -y &&\
    apt-get install -y python-pip python-dev build-essential &&\
    pip install -r requirements.txt
COPY ./app /app
WORKDIR /app 
ENTRYPOINT ["python"]
CMD [". setenv.sh"]
CMD ["app.py"]
