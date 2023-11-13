FROM python:3.9.0

WORKDIR /home/

RUN echo "testing_2"

RUN git clone https://github.com/sungno/pragmatic.git

WORKDIR /home/pragmatic/

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient


RUN python manage.py collectstatic

EXPOSE 8000

RUN echo "testing_4"

CMD ["bash", "-c", "python manage.py migrate --settings=pragmatic.settings.deploy && gunicorn pragmatic.wsgi --env DJANGO_SETTINGS_MODULE=pragmatic.settings.deploy --bind 0.0.0.0:8000"]

