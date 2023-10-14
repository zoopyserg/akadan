# syntax=docker/dockerfile:1
FROM ruby:3.0.2

# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# RUN curl -sL https://deb.nodesource.com/setup_17.x | bash -

RUN apt-get update -qq
RUN apt-get install -y nodejs npm # yarn

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y yarn=1.22.19-1
# RUN curl -qL https://www.npmjs.com/install.sh | sh

RUN apt-get install -y redis-server postgresql-client apt-transport-https
# RUN npm install --global yarn
RUN mkdir /akadan
WORKDIR /akadan
COPY . /akadan
RUN bundle install
# RUN ./bin/webpack

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
