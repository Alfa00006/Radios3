FROM nikolaik/python-nodejs:python3.9-nodejs17
RUN apt-get update \
    && apt-get install -y nodejs \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY . /app
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

RUN mkdir /Radios3
WORKDIR /Radios3

CMD ["python3", "main.py"]
