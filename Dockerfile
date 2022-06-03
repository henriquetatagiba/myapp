FROM ruby:3.1.2

RUN curl https://deb.nodesource.com/setup_15.x | bash -
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock package.json yarn.lock ./

RUN bundle install --jobs 20 --retry 5 --without test

RUN yarn install --silent

COPY . ./

RUN rm -f tmp/pids/server.pid

EXPOSE 3000