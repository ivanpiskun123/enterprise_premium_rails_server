FROM ruby:2.7.3

RUN apt-get update -qq && apt-get install -y postgresql-client

RUN bundle config --global

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN rm -f /tmp/pids/server.pid

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
