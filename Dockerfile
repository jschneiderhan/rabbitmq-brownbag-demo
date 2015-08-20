FROM ruby:2.2

RUN mkdir /app
COPY app /app
WORKDIR /app

RUN gem install bunny --version 2.1.0
