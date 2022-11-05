FROM ruby:3.1.2-slim as builder

RUN apt-get update && apt-get install -y curl build-essential
RUN gem install bundler

WORKDIR /build/hasher-webserver
COPY Gemfile* /build/hasher-webserver
RUN bundle install 
COPY . /build/hasher-webserver

#FROM ruby:3.1.2-slim

#WORKDIR /deploy/hasher-webserver
#COPY --from=builder /build/hasher-webserver /deploy/hasher-webserver
#RUN bundle config --local path vendor/bundle
#RUN bundle config --local without development:test:assets
#RUN mkdir -p tmp/pids

#EXPOSE 4567

ENTRYPOINT ["ruby", "app.rb"]
