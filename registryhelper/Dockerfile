FROM python:2.7

# RUN adduser --disabled-password --gecos '' u

WORKDIR /src
COPY src/requirements.txt /src/

RUN pip install -r requirements.txt

COPY src /src

CMD python app.py
