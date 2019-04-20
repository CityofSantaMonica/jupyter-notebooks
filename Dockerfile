FROM python:3

WORKDIR /usr/src/notebooks

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

EXPOSE 8888

ENTRYPOINT ["jupyter", "notebook"]
CMD [".", "--allow-root", "--ip=0.0.0.0", "--port=8888", "--no-browser"]