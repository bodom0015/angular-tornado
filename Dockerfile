# This image will be based on the oficial nodejs docker image
FROM node:argon

# Install core dependencies: NodeJS / NPM
RUN \
    apt-get update -y && \
    apt-get install -y python && \
    mkdir -p /usr/src/app

WORKDIR /usr/src/app

# Copy source
COPY package.json /usr/src/app/

# Install dependencies: Pip / Bower / Tornado / Angular / Bootstrap
RUN \
    wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py && \
    python get-pip.py && \
    pip install tornado && \
    npm install -g bower && \
    bower install angular bootstrap --allow-root

COPY . /usr/src/app/

EXPOSE 8080

CMD ["python", "app.py"]
