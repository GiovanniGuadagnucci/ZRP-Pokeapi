FROM ruby:2.7.1

LABEL Name=zrppair Version=0.0.1

EXPOSE 3000

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

WORKDIR /app
COPY . /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]