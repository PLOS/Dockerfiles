FROM python:2.7

# This is a helper web service since the registry does not expose image listing

WORKDIR /src
# COPY src/requirements.txt /src/

RUN pip install flask

COPY src /src

CMD python app.py
