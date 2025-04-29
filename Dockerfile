FROM debian:latest AS build-env

RUN apt-get update
RUN apt-get install -y curl git unzip

RUN echo ${RUN_FILE}

ENV TAR_OPTIONS="--no-same-owner"
ARG RUN_FILE=lib/main.dart

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor -v

RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

RUN mkdir /app/
COPY . /app/
WORKDIR /app/

RUN flutter clean
RUN ["chmod", "+x", "/app/prebuild_script.sh"]
RUN ["/bin/bash", "-c", "/app/prebuild_script.sh"]

RUN echo ${RUN_FILE}

RUN flutter build web -t ${RUN_FILE}


FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html

EXPOSE 9000