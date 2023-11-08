FROM python:3.9.0

WORKDIR /home/

RUN echo "testing123"

RUN git clone https://github.com/sungno/pragmatic.git

WORKDIR /home/pragmatic/

RUN pip install --upgrade pip

RUN  pip install -r requirements.txt

RUN echo "SECRET_KEY=django-insecure-g&+=hcjizd0o4e4^d@!40^(%5p*8d-bs9zzbqff3)f1ae2572$" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver" "0.0.0.0:8000"]

