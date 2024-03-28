# À partir de l'image officielle Ruby
FROM ruby:3.2.2

# Installez Node.js et Yarn (nécessaires pour la compilation des assets Rails)
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# Définissez le répertoire de travail
WORKDIR /MY_BASECAMP_1

# Ajoutez le Gemfile et le Gemfile.lock à l'image
COPY Gemfile /MY_BASECAMP_1/Gemfile
COPY Gemfile.lock /MY_BASECAMP_1/Gemfile.lock

# Installez les gems
RUN bundle install

# Exécutez les migrations
RUN bundle exec rails db:migrate

# Copiez le reste de l'application dans l'image
COPY . /MY_BASECAMP_1

# Exposez le port sur lequel le serveur Rails s'exécutera
EXPOSE 3000

# Définissez la commande pour démarrer le serveur
CMD ["rails", "server", "-b", "0.0.0.0"]