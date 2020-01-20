FROM ruby:2.6.3

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN gem install bundler --no-document

WORKDIR /usr/src/app


COPY Gemfile* /usr/src/app/

# Uncomment the line below if Gemfile.lock is maintained outside of build process
# COPY Gemfile.lock /usr/src/app/


RUN bundle install

COPY . /usr/src/app
EXPOSE 3000
#CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
CMD ["rails", "server", "-b", "0.0.0.0"]
