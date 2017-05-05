FROM ruby:2.3-slim
# Instala nuestras dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev
# Establece nuestro path
ENV INSTALL_PATH /usr/src/app
# Crie nuestro directório
RUN mkdir -p $INSTALL_PATH
# Establece nuestro path como el directório principal
WORKDIR $INSTALL_PATH
# Copia nuestro Gemfile dentro del container
COPY Gemfile ./
# Instala las Gems
RUN bundle install
# Copia nuestro código dentro del container
COPY . .
# Start nuestro server
CMD puma -C config/puma.rb