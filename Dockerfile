FROM ruby:3.3

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile ./

RUN bundle lock --no-color \
    && bundle install \
    && bundle check

COPY . .

EXPOSE 4567

CMD ["ruby", "app.rb", "-o", "0.0.0.0"]