FROM python:3.9.0

WORKDIR /home/

RUN echo "testing"

RUN git clone https://github.com/sungno/pragmatic.git

WORKDIR /home/pragmatic/

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN echo "SECRET_KEY=django-insecure-g&+=hcjizd0o4e4^d@!40^(%5p*8d-bs9zzbqff3)f1ae2572$" > .env

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --setting=pragmatic.settings.deploy && gunicorn pragmatic.wsgi --env DJANGO_SETTINGS_MODULE=pragmatic.settings.deploy --bind 0.0.0.0:8000"]

