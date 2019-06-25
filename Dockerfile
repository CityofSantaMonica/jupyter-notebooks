FROM python:3.7

WORKDIR /usr/src/notebooks

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip && \
    pip install -r requirements.txt
