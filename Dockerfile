FROM ruby:2.6.0
LABEL Roman Konoplev <roman@konoplev.pro>

WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs && \
    npm install yarn -g

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD rm -f /app/tmp/pids/server.pid && \
    rake assets:precompile && \
    rails db:migrate && \
    rails server -b 0.0.0.0
